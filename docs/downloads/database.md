---
layout: default
title: DynastyProcess.com Database
---

# DynastyProcess.com Database

## Download

[Web App](https://dynastyprocess.shinyapps.io/dynastyprocess) > a web app created by Joe Sydlowski! 

[CSV format](https://github.com/tanho63/dynastyprocess/blob/master/files/database.csv) > can be linked to by any data import tool (make sure you link to the raw data!)

[Excel workbook format](https://github.com/tanho63/dynastyprocess/blob/master/files/database-excel-macro.xlsm) > has all of the API connections, so you can refresh the data for yourself if you're feeling impatient!

## About 

I've seen a lot of fantasy statistical databases ([FFStatistics.com](http://ffstatistics.com) is a great free one) but none tailored specifically to dynasty. This database is an attempt to aggregate the wide variety of information dynasty owners should have easy access to. 

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

|Column Name|Description|Source|
|:---|:---:|---:|
|sleeper_id|sleeper.app player ID|Sleeper API|
|fantasy_data_id|FantasyData.com player ID|MFL API|
|rotowire_id|RotoWire player ID|MFL API|
|sportradar_id|SportsRadar.com player ID|MFL API|
|gsis_id|NFL GSIS ID|Sleeper API|
|rotoworld_id|RotoWorld player ID|MFL API|
|yahoo_id|Yahoo player ID|MFL API|
|espn_id|ESPN player ID|Sleeper API|
|stats_id|Stats ID|MFL API|
|mfl_id|MyFantasyLeague player ID|MFL API|
|pfr_id|ProFootballReference player ID|PFR (linkify.cgi)|
|first_name|Player first name|Sleeper API|
|last_name|Player last name|Sleeper API|
|name|Player full name|MFL API|
|mergename|Cleaned up name for merges (no apostrophes, periods, Jr’s or Sr’s etc)|DynastyProcess.com|
|pos|Position|MFL API|
|team|Team|MFL API|
|age|Age|MFL API|
|college|College|MFL API|
|draft_year|Draft Year|MFL API|
|draft_round|Draft Round|MFL API|
|draft_pick|Selection # inside Round|MFL API|
|tgts|Targets (2018)|AirYards.com|
|recs|Receptions (2018)|AirYards.com|
|reYDs|Receiving Yards (2018)|AirYards.com|
|ruYDs|Rushing Yards (2018)|AirYards.com|
|reTDs|Receiving TDs (2018)|AirYards.com|
|ruTDs|Rushing TDs (2018)|AirYards.com|
|airYDs|AirYards (2018)|AirYards.com|
|yac|YardsAfterCatch (2018)|AirYards.com|
|tm_paATTs|Team Pass Attempts (2018)|AirYards.com|
|tm_airYDs|Team Air Yards (2018)|AirYards.com|
|height|Player Height (inches)|MFL API|
|weight|Player Weight (pounds)|MFL API|
|armLength|Arm Length (inches)|RelativeAthleticScores.com|
|handsize|Hand Size (inches)|RelativeAthleticScores.com|
|forty|40 Yard Dash (seconds)|RelativeAthleticScores.com|
|twenty|20 Yard Split (of forty) (s)|RelativeAthleticScores.com|
|tentime|10 Yard Split (of forty) (s)|RelativeAthleticScores.com|
|bench|Bench Press (maximum reps of 225 pounds)|RelativeAthleticScores.com|
|vertical|Vertical Jump (standing start) (inches)|RelativeAthleticScores.com|
|broadInches|Broad Jump (standing start) (inches)|RelativeAthleticScores.com|
|shuttle|Shuttle drill (s)|RelativeAthleticScores.com|
|cone|3-Cone Drill (s)|RelativeAthleticScores.com|
|RAS|RelativeAthleticScore (1-10 based on all players in history)|RelativeAthleticScores.com|
|gms|Regular season games played (2018)|AirYards.com|
|tgtshare|Percentage of season team targets|AirYards.com|
|aydshare|Percentage of season team airyards totals|AirYards.com|
|wopr|Weighted Opportunity Rating - 1.5 x tgtshare + 0.7 x aydshare|AirYards.com|
|racr|Receiving-AirYard-Conversion-Ratio (Receiving Yards/Air Yards)|AirYards.com|
|adot|Average Depth of Target|AirYards.com|
|offSnaps%|% of season team offensive snaps|Pro-Football-Reference|
|offSnaps|# of season offensive snaps|Pro-Football-Reference|
|salary_avg|Average salary amount over length of contract|Spotrac|
|fa_year|Year of contract expiry|Spotrac|
|dynoECR|FantasyPros Dynasty Overall ExpertConsensusRanking|FantasyPros.com|
|dyno2QBECR|Converted dynoECR for a 2QB system (based on algorithm)|DynastyProcess.com|
|dynoSD|Standard deviation of dynoECR|FantasyPros.com|
|dynpECR|FantasyPros Dynasty Positional ExpertConsensus Ranking|FantasyPros.com|
|dynpSD|Standard deviation of dynpECR|FantasyPros.com|
|redpECR|FantasyPros Redraft Positional ExpertConsensusRanking|FantasyPros.com|
|redpSD|Standard deviation of redpECR|FantasyPros.com|
