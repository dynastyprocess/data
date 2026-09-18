source(".github/scripts/apply_player_id_overrides.R")

expect_error <- function(expr, pattern) {
  error <- tryCatch({ force(expr); NULL }, error = identity)
  stopifnot(inherits(error, "error"), grepl(pattern, conditionMessage(error)))
}
rule <- read.csv("files/player_id_overrides.csv", colClasses = "character")
bad <- data.frame(
  mfl_id = c(16255L, 17470L), gsis_id = c("00-0039000", NA),
  name = c("Deonte Banks", " Luke Altmyer"),
  espn_id = c(42873L, 4597679L), unrelated = c("unchanged", "also unchanged"))
fixed <- apply_player_id_overrides(bad, rule)
expected <- bad
expected$espn_id[1] <- 4428328L
stopifnot(identical(fixed, expected), identical(bad$espn_id[1], 42873L))
stopifnot(identical(apply_player_id_overrides(fixed, rule), fixed))
stopifnot(identical(apply_player_id_overrides(bad, rule[FALSE, ]), bad))
for (convert in list(as.character, as.numeric, as.integer)) {
  x <- bad
  x$espn_id <- convert(x$espn_id)
  y <- apply_player_id_overrides(x, rule)
  stopifnot(typeof(y$espn_id) == typeof(x$espn_id), y$espn_id[1] == 4428328)
}
x <- bad
x$espn_id[1] <- NA_integer_
stopifnot(identical(apply_player_id_overrides(x, rule), expected))
expect_error(apply_player_id_overrides(bad[-1, ], rule), "exactly one")
expect_error(apply_player_id_overrides(rbind(bad, bad[1, ]), rule), "exactly one")
expect_error(apply_player_id_overrides(bad, rbind(rule, rule)), "Multiple reviewed")
x <- bad
x$gsis_id[1] <- "00-0000001"
expect_error(apply_player_id_overrides(x, rule), "Identity mismatch")
x <- bad
x$name[1] <- "Another Banks"
expect_error(apply_player_id_overrides(x, rule), "Identity mismatch")
x <- bad
x$espn_id[1] <- 123456L
expect_error(apply_player_id_overrides(x, rule), "Unexpected ESPN ID")
x <- bad
x$espn_id[2] <- 4428328L
expect_error(apply_player_id_overrides(x, rule), "already belongs")
x <- rule
x$to_espn_id <- "not-an-id"
expect_error(apply_player_id_overrides(bad, x), "Invalid replacement")

# Both formats are changed together, metadata/classes survive, and a second
# application does not rewrite files. No source endpoint or credentials needed.
folder <- tempfile("override-test-")
dir.create(folder)
csv <- file.path(folder, "players.csv")
rds <- file.path(folder, "players.rds")
readr::write_csv(bad, csv, na = "NA")
attr(bad, "provenance") <- "test archive"
saveRDS(bad, rds)
update_player_id_exports(csv, rds, "files/player_id_overrides.csv")
expected_rds <- bad
expected_rds$espn_id[1] <- 4428328L
stopifnot(identical(readRDS(rds), expected_rds))
out <- read.csv(csv, colClasses = "character")
stopifnot(out$espn_id[1] == "4428328", out$espn_id[2] == "4597679")
hashes <- tools::md5sum(c(csv, rds))
update_player_id_exports(csv, rds, "files/player_id_overrides.csv")
stopifnot(identical(tools::md5sum(c(csv, rds)), hashes))

# CSV/RDS disagreement and invalid identity must fail before either write.
x <- readRDS(rds)
x$espn_id[1] <- 42873L
saveRDS(x, rds)
hashes <- tools::md5sum(c(csv, rds))
expect_error(update_player_id_exports(csv, rds, "files/player_id_overrides.csv"), "CSV and RDS disagree")
stopifnot(identical(tools::md5sum(c(csv, rds)), hashes))
readr::write_csv(x, csv, na = "NA")
bad_rule <- rule
bad_rule$gsis_id <- "00-0000001"
rule_path <- file.path(folder, "bad_rule.csv")
readr::write_csv(bad_rule, rule_path)
hashes <- tools::md5sum(c(csv, rds))
expect_error(update_player_id_exports(csv, rds, rule_path), "Identity mismatch")
stopifnot(identical(tools::md5sum(c(csv, rds)), hashes))
unlink(c(csv, rds, rule_path))
unlink(folder)

# Replay the complete checked-in database, not only the small fixture. Preserve
# every unrelated CSV line and every RDS value, type and attribute.
folder <- tempfile("override-full-")
dir.create(folder)
csv <- file.path(folder, "players.csv")
rds <- file.path(folder, "players.rds")
stopifnot(file.copy("files/db_playerids.csv", csv),
          file.copy("files/db_playerids.rds", rds))
original_lines <- readLines(csv, warn = FALSE)
original_rds <- readRDS(rds)
ix <- which(as.character(original_rds$mfl_id) == "16255")
stopifnot(length(ix) == 1L)
expected_rds <- original_rds
expected_rds$espn_id[ix] <- if (is.character(expected_rds$espn_id)) "4428328" else
  if (is.integer(expected_rds$espn_id)) 4428328L else 4428328
update_player_id_exports(csv, rds, "files/player_id_overrides.csv")
stopifnot(identical(readRDS(rds), expected_rds))
new_lines <- readLines(csv, warn = FALSE)
stopifnot(length(original_lines) == length(new_lines))
changed <- which(original_lines != new_lines)
stopifnot(length(changed) <= 1L,
          all(grepl("^16255,", original_lines[changed])))
hashes <- tools::md5sum(c(csv, rds))
update_player_id_exports(csv, rds, "files/player_id_overrides.csv")
stopifnot(identical(hashes, tools::md5sum(c(csv, rds))))
unlink(c(csv, rds))
unlink(folder)
cat("Player-ID override regression tests passed.\n")
