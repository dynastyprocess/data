---
layout: default
title: DynastyProcess.com Database
permalink: /database
---

# DynastyProcess.com Database

## Download

[Web App](http://apps.dynastyprocess.com/database) > a web app created by [Joe Sydlowski](http://twitter.com/JoeSydlowskiFF)!

[CSV format](https://github.com/tanho63/dynastyprocess/blob/master/files/database.csv) > can be linked to by any data import tool (make sure you link to the raw data!)

[Excel workbook format](https://github.com/tanho63/dynastyprocess/blob/master/files/workbooks/database-excel-macro.xlsm) > has all of the API connections, so you can refresh the data for yourself if you're feeling impatient!

## About

There are a lot of fantasy statistical databases available now, but very few (if any) are tailored to DynastyFF. This database is an attempt to aggregate the wide variety of information dynasty owners should have easy access to.

#### Already Connected
- FantasyPros ECR for dynasty and redraft
- 2018 AirYards.com data
- Spotrac contract data
- 2018 Snap Counts from Pro-Football-Reference
- Draft athletic data from RelativeAthleticScores.com (shoutout to Kent Lee Platte [@MathBomb](https://twitter.com/MathBomb))

...and because this database can't always aggregate every last source of data, it also includes playerIDs for MFL/Sleeper/nflGSIS/Rotoworld/ESPN/PFR IDs for easy extensions and additions!

#### Possible Extensions
- College Production Statistics (Dominator Ratings, Breakout Ages, Market Shares)
- Career Fantasy Statistics (Totals, per-game averages)
- Prospect Film Grades (NFL Draft Scout? NFL.com Prospect Grades?)

*Got any other suggestions? [Let me know!](http://twitter.com/_TanHo)*

## Data Reference
| Index | Category | Label | Description | Source |
|-------|-------------------------|--------------------|-------------------------------------------------------------------------------|----------------------------|
| 1 | ID | gsis_id | NFL GSIS ID | Sleeper API |
| 2 | ID | pfr_id | ProFootballReference playerID | PFR (linkify.cgi) |
| 3 | ID | mfl_id | MyFantasyLeague playerID | MFL API |
| 4 | ID | sleeper_id | sleeper.app playerID | MFL API |
| 5 | ID | fantasy_data_id | FantasyData playerID | MFL API |
| 6 | ID | rotowire_id | RotoWire playerID | MFL API |
| 7 | ID | sportradar_id | SportsRadar playerID | MFL API |
| 8 | ID | rotoworld_id | RotoWorld playerID | MFL API |
| 9 | ID | yahoo_id | Yahoo playerID | MFL API |
| 10 | ID | espn_id | ESPN playerID | MFL API |
| 11 | ID | stats_id | Stats playerID | MFL API |
| 12 | bio | first_name | Player first name | Sleeper API |
| 13 | bio | last_name | Player last name | Sleeper API |
| 14 | bio | name | Player full name | Sleeper API |
| 15 | bio | mergename | Cleaned up name for merges (no apostrophes, periods, Jr's, Sr's etc) | DynastyProcess.com |
| 16 | bio | pos | Position | MFL API |
| 17 | bio | team | Team | MFL API |
| 18 | bio | age | Age | MFL API |
| 19 | contract | salary_avg | Average Annual Salary | Spotrac |
| 20 | contract | fa_year | Contract Expiry Year | Spotrac |
| 21 | fantasypros | dynoECR | Expert Consensus Rank, Dynasty Overall | FantasyPros |
| 22 | fantasypros | dyno2QBECR | Converted dynoECR for a 2QB system (algorithm) | DynastyProcess.com |
| 23 | fantasypros | dynoSD | Standard deviation of dynoECR | FantasyPros |
| 24 | fantasypros | dynpECR | Expert Consensus Rank, Dynasty Positional | FantasyPros |
| 25 | fantasypros | dynpSD | Standard deviation of dynpECR | FantasyPros |
| 26 | fantasypros | rdpECR | Expert Consensus Rank, Redraft Positional (Draft) | FantasyPros |
| 27 | fantasypros | rdpSD | Standard deviation of rdpECR | FantasyPros |
| 28 | draft | draft_year | Draft Year | MFL API |
| 29 | draft | college | College | MFL API |
| 30 | draft | draft_round | Draft Round | MFL API |
| 31 | draft | draft_pick | Selection # inside round | MFL API |
| 32 | draft | draft_rookieadp | Rookie Average Draft Position | Mizelle/DLF ADP |
| 33 | draft | draft_2QBrookieADP | 2QB Rookie Average Draft Position | TwoQBs.com |
| 34 | athletic | height | Player Height (inches) | MFL API |
| 35 | athletic | weight | Player Weight (pounds) | MFL API |
| 36 | athletic | armLength | Arm Length (inches) | RelativeAthleticScores.com |
| 37 | athletic | handsize | Hand Size (inches) | RelativeAthleticScores.com |
| 38 | athletic | forty | 40 Yard Dash (s) | RelativeAthleticScores.com |
| 39 | athletic | twenty-split | First 20 yards of 40 (s) | RelativeAthleticScores.com |
| 40 | athletic | ten-split | First 10 yards of 40 (s) | RelativeAthleticScores.com |
| 41 | athletic | bench | Bench Press (maximum reps of 225) | RelativeAthleticScores.com |
| 42 | athletic | vertical | Vertical Jump (standing start) (inches) | RelativeAthleticScores.com |
| 43 | athletic | broad | Broad Jump (standing start) (inches) | RelativeAthleticScores.com |
| 44 | athletic | shuttle | Shuttle drill (s) | RelativeAthleticScores.com |
| 45 | athletic | cone | 3-cone drill (s) | RelativeAthleticScores.com |
| 46 | athletic | RAS | RelativeAthleticScore (1-10 athletic ranking based on all players in history) | RelativeAthleticScores.com |
| 47 | season-stats-snaps | offSnaps | # of season offensive snaps | PFR |
| 48 | season-stats-snaps | offSnapsPct | % of season team offensive snaps | PFR |
| 49 | season-stats-snaps | gms | Games played (2018) | PFR |
| 50 | season-stats-passing | paATTs | Pass attempts (2018) | NFLscrapR-data |
| 51 | season-stats-passing | paCMPs | Pass completions (2018) | NFLscrapR-data |
| 52 | season-stats-passing | paYDs | Pass yards (2018) | NFLscrapR-data |
| 53 | season-stats-passing | paTDs | Passing TDs (2018) | NFLscrapR-data |
| 54 | season-stats-passing | paINTs | Interceptions (2018) | NFLscrapR-data |
| 55 | season-stats-passing | pa_aya | Average Yards Per Attempt (2018) | NFLscrapR-data |
| 56 | season-stats-passing | tm_paATTs | Team Pass Attempts (2018) | NFLscrapR-data |
| 57 | season-stats-rushing | ruATTs | Rush Attempts (2018) | NFLscrapR-data |
| 58 | season-stats-rushing | ruYDs | Rush Yards (2018) | NFLscrapR-data |
| 59 | season-stats-rushing | ruTDs | Rush Touchdowns (2018) | NFLscrapR-data |
| 60 | season-stats-rushing | tm_ruATTs | Team Rush Attempts | NFLscrapR-data |
| 61 | season-stats-rushing | tm_ruYDs | Team Rush Yards | NFLscrapR-data |
| 62 | season-stats-rushing | ms_ruATTs | Market Share of Team Rush Yards | NFLscrapR-data |
| 63 | season-stats-receiving | tgts | Targets | NFLscrapR-data |
| 64 | season-stats-receiving | recs | Receptions | NFLscrapR-data |
| 65 | season-stats-receiving | reYDs | Receiving Yards | NFLscrapR-data |
| 66 | season-stats-receiving | reTDs | Receiving Touchdowns | NFLscrapR-data |
| 67 | season-stats-receiving | reAYDs | Receiving AirYards | NFLscrapR-data |
| 68 | season-stats-receiving | wopr | Weighted Opportunity Rating = 1.5 x ms_tgts + 0.7 x ms_AYDs | NFLscrapR-data |
| 69 | season-stats-receiving | racr | Receiving-AirYard Conversion Ratio = reYDs/reAYDs | NFLscrapR-data |
| 70 | season-stats-receiving | adot | Average Depth of Target = reAYDs/tgts | NFLscrapR-data |
| 71 | season-stats-receiving | yac | Yards After Catch | NFLscrapR-data |
| 72 | season-stats-receiving | ms_tgts | Market Share of Team Targets | NFLscrapR-data |
| 73 | season-stats-receiving | ms_AYDs | Market Share of Team AirYards | NFLscrapR-data |
| 74 | season-stats-receiving | tm_tgts | Team Targets | NFLscrapR-data |
| 75 | season-stats-receiving | tm_AYDs | Team AirYards | NFLscrapR-data |
| 76 | season-stats-firstdowns | 1Ds | First Downs | NFLscrapR-data |
| 77 | season-stats-firstdowns | tm_1Ds | Team First Downs | NFLscrapR-data |
| 78 | season-stats-firstdowns | ms_1Ds | Market Share of First Downs | NFLscrapR-data |
| 79 | season-stats-fantasy | ppr | Season Fantasy Points in PPR league | NFLscrapR-data |
| 80 | season-stats-fantasy | ppr/g | PPR per game average | NFLscrapR-data |
