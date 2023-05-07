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

- [curl](needs link) for getting the hackernews page. 
- [pup](needs link) for html scraping.
- [ftfy](needs link) fix up garbled â€“ text.
- [sqlite](needs link) stash the posts / links / metadata into a database

## Scraping

CSS selectors for the useful parts of a hackernews:

- Story title: 'tr.athing td.title > span.titleline > a'
- Story URL: 'tr.athing td.title > span.titleline > a[href]'
- Comment URL: 'tr.athing + tr td.subtext > span.subline > a:last-child'
- Comment count: 'tr.athing + tr td.subtext > span.subline > a:last-child > span'
- Score: 'tr.athing + tr td.subtext > span.subline > span.score'
- Submitted by username: 'tr.athing + tr td.subtext > span.subline > a.hnuser'

``` sh

```



