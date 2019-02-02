---
layout: post
title: Learning Where To Look For NFL Data
category: Data
---

# Learning Where to Look For NFL Data :mag_right:

February 2nd, 2019

Yesterday, I stumbled across [a Reddit post ](https://www.reddit.com/r/DynastyFF/comments/am6rc2/a_big_fat_unwieldy_table_of_2018_rb_stats_that_i/) in which u/Sow_Crates compiled some interesting statistics (fantasy points, targets, receptions, carries, TDs, touches, and opportunities) for a small sample of RBs. While the data on the surface was interesting (e.g. despite Christian McCaffrey's notoriously high snap share, Ezekiel Elliott had a higher number of opportunities per game), I was piqued by the comments Sow_Crates made about the difficulty of the data collection process: 

> "I'll probably do it when I'm done hating how I didn't have a quicker way of getting the stats I wanted" ... "plugging the numbers in sapped any optimism I had of actually saying anything about them"

I thought to myself that I would take a stab at compiling the data...and thirteen minutes later, I'd made a data set compiling 2018 week-by-week RB rushing and receiving stats!

![data set](/assets/images/sowcrates1.png)

No, I didn't time myself (I just checked the timestamps between my Reddit comments) - but it did make me realize that my facility with finding and compiling NFL data isn't common to everyone. Free data is much easier to get to these days, so let's dive in to a) the way I approached it and b) an easier way to find the data. 

## A) Combining nflscrapR-data play-by-play data with the DynastyProcess.com database

The gold standard of free NFL data sources is the [JSON data feed](http://www.nfl.com/liveupdate/game-center/2012010101/2012010101_gtd.json) that powers the [NFL.com GameCenter feed you're probably familiar with](https://www.nfl.com/gamecenter/2019020300/2018/POST22/patriots@rams?icampaign=scoreStrip-globalNav-2019020300). I like to reference Ron Yurko's [nflscrapR.csv play-by-play data files](https://github.com/ryurko/nflscrapR-data), which is essentially a cleaned up CSV version of that data. (Sidenote while I'm discussing this - the [actual nflscrapR R package](https://github.com/maksimhorowitz/nflscrapR) lets you access the data live/real-time, but that's usually overkill for my purposes + I don't have a background in R programming. I'll happily just pull from the CSV's). 

These CSVs give you access to ~45000 plays and 100 columns of data for the NFL regular season. This would be incredibly daunting if you were to use Excel formulas to do your analysis - but I have better tools at my disposal like PowerQuery, so I shall wander in with no fear! Here's a video for you to follow along with: 

<div style="width:100%;height:0px;position:relative;padding-bottom:56.327%;"><iframe src="https://streamja.com/embed/EmAb" frameborder="0" width="100%" height="100%" allowfullscreen style="width:100%;height:100%;position:absolute;"></iframe></div>

1. Once I've loaded the data into the program, the first order of business is to drill down to just the few columns and rows that we need to access. For the purpose of compiling weekly RB stats, I want the following columns: 

    > possession team, game date, description, play_type, yards_gained, rush_attempt, pass_attempt, pass_TD, rush_TD, completed_pass, receiver_ID, rusher_ID

2. Then, we're going to drill down to the play-types I'm interested in (passes and runs), and then combine the receiverID and rusherID fields so that they are one column. We'll also calculate rushing yards and receiving yards here as rush_attempt x yards_gained and pass_attempt x yards_gained

3. We'll then use the Group By function to combine all the data for each player_id each week - creating weekly totals for carries, rushing yards, rushing touchdowns, targets, receptions, and receiving touchdowns. We can also add a calculation for touches (carries+receptions) and opportunities (carries + targets). Finally, we'll also add a calculation for week numbers so that we're not looking at actual date-dates. I do this by subtracting the date from September 6, 2018 (the kickoff date), dividing by 7 days/week, rounding down to the nearest whole number, and adding 1. 

4. At this point we've got weekly stats for a bunch of playerIDs - it'd be a lot more helpful to have names and positions attached to these, wouldn't it? There isn't a handy way to assign names and positions from within this file, but the [DynastyProcess.com Database](/downloads) has the nflGSIS IDs for the vast majority of players with statistics - so let's take a minute to set up a query to that database so we can merge in the IDs. 

5. Once we've got the merge set up, we can then filter for just running backs...and that'll get us to where I stopped previously. To finish off the rest of the calculations to get to where Sow_Crates finished off, we can use Group-By to combine the weekly data into season-long data, and then run a few calculations to get fantasy points and efficiency stats. 

## B) Or, you could use FFStatistics.com to get access to very similar data!

I realized after this that you could probably get to very similar efficiency calculations simply by accessing the FFStatistics database and using a few filters. 

1. [https://www.ffstatistics.com/tools-and-data/](https://www.ffstatistics.com/tools-and-data/)

2. FFStatistics Database (hover) -> Running Back. Select Columns:

	>Year, Player, Games, Team, RushAtt, RushYards, RushTDs, Targets, Receptions, RecYards, RecTDs, PointsPerTarget, etc

3. and sort/filter to your heart's content!

(There used to be a "download data" option but I'm wondering if that's been removed... :thinking:)

## Conclusion

At the end of the day, NFL data is much more available than it used to be - so all we need to do is find out how to get at it! PowerQuery is my favourite language/program to use, but there are certainly other ways (R, Python, or even just web-based access like FFStatistics). I'm not quite sure why I leapt to play-by-play data this time (it may be because I was just modifying the code that [generated this tweet](https://twitter.com/_TanHo/status/1088520821109338114?s=20)) - hindsight me says that ffstatistics would have been much easier.

Hope you enjoyed my inaugural blog post and I'm happy to answer any questions on Twitter [@_TanHo](https://www.twitter.com/_TanHo). 