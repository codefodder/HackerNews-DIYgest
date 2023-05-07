# HN Digest yourself

So, turns out this hndigest thingy sneaks in some middleman links in their
emails. You click on a story or comment link, but it's actually a link from
hndigest. But let's be real, who has time to chase after their clicks like a
madman? I only noticed this because I was going through 17 years of emails (yes,
I'm a hoarder). I was using hndigest to keep track of all the cool stories on
hn, but then I found out those links don't even work after 5 months. So long,
hndigest, it's been fun. *hits unsubscribe*

# Guess I better digest Hacker news myself.

## These are the tools I'll use:

- [curl](https://curl.se/) for getting the hackernews page.
- [pup](https://github.com/ericchiang/pup) for html scraping.
- [ftfy](https://github.com/LuminosoInsight/python-ftfy) fix up garbled â€“ text.
- [sqlite](https://www.sqlite.org/index.html) stash the posts / links / metadata into a database.

## Scraping

CSS selectors for the useful parts of a hackernews:

- Story title: `tr.athing td.title > span.titleline > a`
- Story URL: `tr.athing td.title > span.titleline > a[href]`
- Comment URL: `tr.athing + tr td.subtext > span.subline > a:last-child`
- Comment count: `tr.athing + tr td.subtext > span.subline > a:last-child > span`
- Score: `tr.athing + tr td.subtext > span.subline > span.score`
- Submitted by username: `tr.athing + tr td.subtext > span.subline > a.hnuser`
- Datetime: `tr.athing + tr td.subtext > span.subline > span.age[title]`

It's worth noting that YC Posts will not have score, comments, username etc. Datetime is there, but on:

- Datetime: `tr.athing + tr td.subtext > span.age[title]`

## Database

We will store everything in a Sqlite database, in a stories table:

``` sh
CREATE TABLE IF NOT EXISTS stories
(id INTEGER PRIMARY KEY AUTOINCREMENT,
title TEXT,
datetime TEXT,
link TEXT UNIQUE,
score INT,
comment_url TEXT,
comment_count INT,
username TEXT,
userlink TEXT);
```

## Cron workflow

I use the Github actions scheduled workflow to periodically run and fetch stories from the hackernews front page. The score and comment count will be upated for existing stories.

## What's next...

The idea is this can serve as a replacement for HNDigest, and you can fork the repo to have your own.  I'll be adding a workflow that is run once a day and will select the highest scoring stories in the last 24 hours, and send those out as an email.  It should be done pretty soon. (2023-05-07 today)  A preview / sample will be shown here when that happens.

I'll also have it rotate the database every year and save the old previous year's database to the project releases.

I will probably make a database browser for it in Swift too, as I'm doing the same thing to browse my offline email archive.

Anyway, to be continued.
