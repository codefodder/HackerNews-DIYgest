# HackerNews DIYgest

So, I've been subscribed to hndigest for several years. Turns out I didn't notice 
they use middleman links in their emails. Click on a story or comment link, but it's a link from
hndigest that then bounces you on to HackerNews. 

I don't mind all that much, but I was using hndigest to keep track of all the top stories on
Hacker News, but then I found those links don't even work after 5 months. Oh.

So long, hndigest, it's been fun. *hits unsubscribe*

# Better I DIY this myself.

<img width="847" alt="Screenshot 2023-05-08 at 10 10 32 PM" src="https://user-images.githubusercontent.com/71587/236861200-b9099e90-3279-4464-9967-ff7851595efd.png">

Built with:

- **GitHub Actions**
- **HTML**
- **CSS**
- **Gmail**
- [Beautiful Soup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/) for html scraping.
- [ftfy](https://github.com/LuminosoInsight/python-ftfy) fix up garbled â€“ text.
- [sqlite](https://www.sqlite.org/index.html) stash the posts / links / metadata into a database.

### Scrape HN Page...

CSS selectors for the useful parts of a hackernews:

- Story title: `tr.athing td.title > span.titleline > a`
- Story URL: `tr.athing td.title > span.titleline > a[href]`
- Comment URL: `tr.athing + tr td.subtext > span.subline > a:last-child`
- Comment count: `tr.athing + tr td.subtext > span.subline > a:last-child`
- Score: `tr.athing + tr td.subtext > span.subline > span.score`
- Submitted by username: `tr.athing + tr td.subtext > span.subline > a.hnuser`
- Datetime: `tr.athing + tr td.subtext > span.subline > span.age[title]`

It's worth noting that YCombinator's internal posts will not have score, comments, username etc. Datetime is there:

- Datetime: `tr.athing + tr td.subtext > span.age[title]`

## Database

I store everything in a Sqlite database, in a stories table:

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

## Hosted in a Github workflow

I set up a Github actions workflow, scheduled to run on every hour.
Each time the workflow runs, if there's a previous run, it'll fetch sqlite database.
It'll scrape the 30 front page stories, and inserts them into that database.  Updating the score 
on any stories which are still on the front page.  When it's done, it'll save the db as an artifact 
on that workflow run.

## If you want to use it

Please be my guest, just fork the project and setup repo secrets 

- `ACCESS_TOKEN`
  - a Github fine grained access token that can read from repo actions.
- `GMAIL_USER`
  - Emails are sent out using Gmail, so you will need a gmail email name.
- `GM_APPWRD`
  - also a Gmail App Password (Google Account > Security > App Passwords)

It won't need to be downloaded, actions/workflow will take care of everything for you.
