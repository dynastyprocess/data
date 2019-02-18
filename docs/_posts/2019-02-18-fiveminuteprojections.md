---
layout: post
title: Five Minute Projections
author: tan
category: Projections
---

# Five Minute Projections: the Wisdom of Crowds at Work
[*alternative title: How I Once Beat Mike Clay in a Projections Contest With* ***~Zero Research***]

February 18, 2019

![Leader of the PAC logo](/assets/images/pac.jpg)

In August 2018 [Justin Freeman](http://www.twitter.com/JustinFreeman18) ran an open projections contest called Leader of the PAC, attracting amazing fantasy professionals including some personal idols like Mike Clay, Anthony Amico, and Peter Howard. Tempted by the thought of putting my projections to the test, I also entered ... and finished **9th out of 31** - ahead of all three of them!  This post is an accounting of exactly how I came up with the projections - the method may surprise you! (shameless Buzzfeed moment :smirk:)


## The Usual Process of Projections

Despite this being an open contest against fantasy professionals, it doesn't surprise me that there were only 31 entries: creating fantasy projections is a daunting task. As a general process, you need to decide on player totals for every offensive skill position on all 32 teams while deciding a) which factors will have an effect on the numbers you want to generate and b) what kind of effect they will have. Here's a small sample of the factors that might (depending on your choices) have an effect on what numbers you select as predictions:

- Starter and backup player ability (quarterbacks, running backs, receivers, blockers),
- Coach abilities, tendencies, and player-ability-opinions (run/pass ratio, overall play volume, blocking schemes, unexplainable reasons as to why Baker Mayfield and Nick Chubb sat on the bench for as long as they did!),
- Injury risk
- Same-team defensive player/coaching ability
- Strength-of-opponent offense
- Strength-of-opponent defense
- and more.

If you're doing the full dive into these factors, you might end up with a detailed chart a lot like Mike Clay's fantastic #clayprojections. 

![Mike Clay Projections example](https://pbs.twimg.com/media/Dc2a4oLWAAAxEb9.jpg)

**I have a secret - I did absolutely no team or player research when I made these projections!** Instead, I simply combined two things: the freshest possible FantasyPros redraft ranks I could manage to get my hands on, and a database I'd made of historical player PPR points-per-game production.

## Method

1) I downloaded a database of recent player fantasy seasons and drilled it down to just the data I wanted: 2013-2017 PPR points-per-game for each position. It looked a bit like this:

![RawData](/assets/images/projections1.PNG)

2) From there, I ranked each season by PPG for each position and averaged that rank across the five years of data.

![CleanedUp](/assets/images/projections2.PNG)

3) I interpolated the averages so that I could have a number for each decimal point - and that was it, as far as data-prep goes!

![Interpolated](/assets/images/projections3.PNG)

My actual projections workflow then looked like this: 1) Wait for the very last possible day to submit projections. 2) Scrape the FantasyPros ranks. 3) Match the ECR average to the corresponding spot on the table. 4) Copy that number to the submission sheet. No agonizing, no thinking, no actual analysis - just plug and play.

## Does it work?

Evidently it works very well!

![Results](/assets/images/projections4.png)

I'm chuffed that it placed in the top third - it's an incredible validation that simple methods can get you 80% of the way there. **Am I ready to trumpet that Clay, Amico, and Howard are wasting their time  and that this is the best thing since ~~sliced bread~~ Zero RB? The answer is most definitely a NO!**

Using Expert Consensus Ranks is inherently a way to stand on the shoulders of giants - without those guys and many others dedicating that incredible amount of time and effort, the model would fall apart.

James Surowiecki's ["The Wisdom of Crowds"](https://en.wikipedia.org/wiki/The_Wisdom_of_Crowds) relates an anecdote where the crowd at a county fair accurately guesses the weight of an ox when their individual (blind) guesses are averaged. Surowiecki's thesis is that a diverse group of people independently trying to predict an unknown tends to do better than any one expert - and definitely applies to projecting fantasy football.

Surowiecki outlines four key criteria of forming a wise crowd: 

- Diversity of opinion (each person having their own private information),
- Independence (each person's opinion is not directly determined by those around them),
- Decentralization (people are able to specialize and draw on personal/local knowledge), and
- Aggregation (being able to combine everyone's opinions in an objective way)

As far as I can tell, FantasyPros is the closest we can get to having a "wise crowd" - each of the experts does their own work to develop their projections and ranks, so it fulfils all three criteria of being diverse, independent, and decentralized.

Comparatively, DLF Mock ADP is a great resource - but I have some qualms about relying on its objectivity. because it samples a smaller group of people who rely on similar knowledge-bases (i.e. are followers of DLF on Twitter). This reduces the diversity and independence of the crowd - so the overall "wisdom" (as defined by Surowiecki) is reduced. That's not to say it doesn't have its uses - I think it's a great barometer over a period of time - but it's not as good a summary of "true" value as a more neutrally selected set of opinions. 

## What does this mean for me?

Dynasty (and fantasy football in general) is about finding your niche. 

If projections is not your niche, by all means take the opportunity to rely on the wisdom of crowds - it's effective at getting you most of the way there! I use FantasyPros a ton, and obviously highly recommend it as a resource.

If you're able to dedicate the time to develop predictions and fine-tune them, by all means do so! Taking a deep dive into team/player research is always incredibly valuable for improving your fantasy football knowledge - and you'll quickly learn for yourself what you think is predictive and important. 


## Download the Data!

I've uploaded [the PPR projections Excel workbook to GitHub](https://github.com/tanho63/dynastyprocess/blob/master/files/workbooks/fiveminuteprojections.xlsx) so you can play with the data and make your own projections! :smile:
