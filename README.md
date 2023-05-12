# I wanted a long term archive of HN top stories.

 I've held a subscription to hndigest for quite a few years. I didn't notice, or
care that much that they use middleman links in their emails.

I didn't mind all that much, I  wanted to keep track of all the top stories on
Hacker News. Then, quite recently I found those links don't work after 5 months.

*unsubscribe*

# HackerNews DIYgest

So I made my own Hacker News email digest.

![](images/hacker-news-diygest.png)

Built with:

- GitHub Actions - to run the scheduled process
- HTML, CSS
- Gmail
- Python and Bash/Sh
- [Beautiful Soup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/) for html scraping.
- [ftfy](https://github.com/LuminosoInsight/python-ftfy) fix up garbled â€“ text.
- [postgresql](https://www.postgresql.org/) feed story headlines, links etc into a database.
    - [neon.tech (2Gb free tier)](https://neon.tech/docs/introduction/technical-preview-free-tier)

### Gather frontpage stories

Every hour we can pull the stories from the site.

CSS selectors for the useful parts:

- Story title: 
  - `tr.athing td.title > span.titleline > a`
- Story URL: 
  - `tr.athing td.title > span.titleline > a[href]`
- Comment URL: 
  - `tr.athing + tr td.subtext > span.subline > a:last-child`
- Score: 
  - `tr.athing + tr td.subtext > span.subline > span.score`
- Submitted by username: 
  - `tr.athing + tr td.subtext > span.subline > a.hnuser`
- Datetime: 
  - `tr.athing + tr td.subtext > span.subline > span.age[title]`

YCombinator's internal posts will not have score, comments, username etc. Datetime is there, at a different CSS selector path:

- Datetime: `tr.athing + tr td.subtext > span.age[title]`

### Email schedule

At target hour (For me that's 8am local time), a [GitHub workflow](https://github.com/codefodder/HackerNews-DIYgest/blob/master/.github/workflows/hacker-news-diygest-hourly-scrape.yml) composes an email from the top 30 stories of the day, based on score.

## If you want to use it

Please be my guest, you can fork the project and setup repo secrets 

- `ACCESS_TOKEN`
  - a Github fine grained access token that can read from repo actions.
- `GMAIL_USER`
  - Emails are sent out using Gmail, so you will need a gmail email name.
- `GM_APPWRD`
  - also a Gmail App Password (Google Account > Security > App Passwords)
- `PSQLURL`
  - Postgres server `postgresql://username:passwd@host/database`
  - I am using [neon.tech](https://neon.tech)

The workflow looks after everything else
