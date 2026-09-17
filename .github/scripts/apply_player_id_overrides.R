# Reviewed corrections for nonmissing upstream IDs. Keep this separate from
# missing_ids.json: a fill-only merge cannot replace an incorrect populated ID.
apply_player_id_overrides <- function(ids, overrides) {
  required_ids <- c("mfl_id", "gsis_id", "name", "espn_id")
  required_overrides <- c("mfl_id", "gsis_id", "name", "from_espn_id",
                          "to_espn_id", "verification_url")
  if (!is.data.frame(ids) || !all(required_ids %in% names(ids)) ||
      !is.data.frame(overrides) ||
      !all(required_overrides %in% names(overrides))) {
    stop("Missing player-ID or reviewed-override columns.")
  }
  if (!nrow(overrides)) return(ids)
  for (field in required_overrides) {
    value <- as.character(overrides[[field]])
    if (anyNA(value) || any(!nzchar(trimws(value)))) {
      stop("Every reviewed override needs ", field, ".")
    }
  }
  if (anyDuplicated(as.character(overrides$mfl_id))) {
    stop("Multiple reviewed overrides for one MFL ID.")
  }
  if (!(is.character(ids$espn_id) || is.numeric(ids$espn_id)) ||
      is.factor(ids$espn_id)) stop("Unsupported ESPN ID column type.")
  result <- ids
  for (i in seq_len(nrow(overrides))) {
    rule <- overrides[i, , drop = FALSE]
    mid <- as.character(rule$mfl_id)
    ix <- which(as.character(ids$mfl_id) == mid)
    if (length(ix) != 1L) stop("Expected exactly one player for MFL ", mid, ".")
    if (is.na(ids$gsis_id[ix]) || is.na(ids$name[ix]) ||
        as.character(ids$gsis_id[ix]) != as.character(rule$gsis_id) ||
        as.character(ids$name[ix]) != as.character(rule$name)) {
      stop("Identity mismatch for reviewed MFL ", mid, ".")
    }
    previous <- as.character(ids$espn_id[ix])
    replacement <- as.character(rule$to_espn_id)
    allowed <- c(as.character(rule$from_espn_id), replacement)
    if (!is.na(previous) && !previous %in% allowed) {
      stop("Unexpected ESPN ID for MFL ", mid, ": ", previous,
           "; review the correction before publishing.")
    }
    if (!grepl("^[1-9][0-9]*$", replacement)) stop("Invalid replacement ESPN ID.")
    others <- setdiff(seq_len(nrow(result)), ix)
    if (any(as.character(result$espn_id[others]) == replacement, na.rm = TRUE)) {
      stop("Replacement ESPN ID already belongs to another player: ", replacement)
    }
    value <- if (is.integer(ids$espn_id)) as.integer(replacement) else
      if (is.numeric(ids$espn_id)) as.numeric(replacement) else replacement
    if (is.na(value) || as.character(value) != replacement) {
      stop("Replacement cannot be represented in the ESPN ID column.")
    }
    result$espn_id[ix] <- value
  }
  result
}

update_player_id_exports <- function(
    csv_path = "files/db_playerids.csv",
    rds_path = "files/db_playerids.rds",
    overrides_path = "files/player_id_overrides.csv") {
  if (!requireNamespace("readr", quietly = TRUE)) stop("readr is required.")
  read_char_csv <- function(path) readr::read_csv(
    path, col_types = readr::cols(.default = readr::col_character()),
    na = "NA", trim_ws = FALSE, show_col_types = FALSE, progress = FALSE)
  csv <- read_char_csv(csv_path)
  rds <- readRDS(rds_path)
  rules <- read_char_csv(overrides_path)
  # Different row order is harmless; disagreeing identities or ESPN values are
  # not. Refuse to publish a repair to one format while leaving the other stale.
  if (nrow(csv) != nrow(rds) || anyNA(csv$mfl_id) || anyNA(rds$mfl_id) ||
      anyDuplicated(csv$mfl_id) || anyDuplicated(rds$mfl_id)) {
    stop("CSV and RDS need unique nonmissing MFL IDs and matching row counts.")
  }
  ix <- match(csv$mfl_id, as.character(rds$mfl_id))
  if (anyNA(ix)) stop("CSV and RDS player IDs disagree.")
  for (field in c("gsis_id", "name", "espn_id")) {
    if (!identical(as.character(csv[[field]]), as.character(rds[[field]][ix]))) {
      stop("CSV and RDS disagree on ", field, ".")
    }
  }
  updated_csv <- apply_player_id_overrides(csv, rules)
  updated_rds <- apply_player_id_overrides(rds, rules)
  if (identical(updated_csv, csv) && identical(updated_rds, rds)) {
    message("Reviewed player-ID overrides: exports already correct.")
    return(invisible(updated_rds))
  }
  # Prepare and validate both formats before replacing either export. A failed
  # step aborts the workflow before Save public data can commit or push files.
  csv_tmp <- tempfile("playerids-", tmpdir = dirname(csv_path), fileext = ".csv")
  rds_tmp <- tempfile("playerids-", tmpdir = dirname(rds_path), fileext = ".rds")
  on.exit(unlink(c(csv_tmp, rds_tmp)), add = TRUE)
  readr::write_csv(updated_csv, csv_tmp, na = "NA", progress = FALSE)
  saveRDS(updated_rds, rds_tmp)
  roundtrip_csv <- read_char_csv(csv_tmp)
  if (!identical(as.data.frame(roundtrip_csv), as.data.frame(updated_csv)) ||
      !identical(readRDS(rds_tmp), updated_rds)) stop("Export round-trip failed.")
  if (!file.copy(csv_tmp, csv_path, overwrite = TRUE) ||
      !file.copy(rds_tmp, rds_path, overwrite = TRUE)) stop("Cannot replace player-ID exports.")
  changed <- sum(is.na(csv$espn_id) != is.na(updated_csv$espn_id) |
                   (!is.na(csv$espn_id) & !is.na(updated_csv$espn_id) &
                      csv$espn_id != updated_csv$espn_id))
  message("Reviewed player-ID overrides: corrected ", changed, " ESPN ID(s) in CSV and RDS.")
  invisible(updated_rds)
}
