#!/usr/bin/env python3

import os
import sys
import ftfy
import requests
import select

from dbc import *
from bs4 import BeautifulSoup

conn = connect_to_db(os.environ['PSQLURL'])
c = conn.cursor()

# Create tables...
c.execute("""
CREATE TABLE IF NOT EXISTS stories  (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    datetime TIMESTAMP,
    link TEXT UNIQUE,
    score INT,
    comment_url TEXT,
    username VARCHAR(255),
    userlink TEXT);
""")

c.execute(f"""
CREATE TABLE IF NOT EXISTS event_log (
   id SERIAL PRIMARY KEY,
   value VARCHAR(255),
   event VARCHAR(255),
   datetime TIMESTAMP DEFAULT NOW());
""")

hn = "https://news.ycombinator.com/"

print(f"Read from {hn}")
# Send a request to the URL
res = requests.get(hn)
data = res.text

# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(data, 'html.parser')

# Extract the metadata for all stories using the provided selectors
stories = soup.select('tr.athing')
counter = 0

print("HackerNews Scrape/Hourly: adding stories to database...")

for story in stories:
    counter += 1
    # Extract title and link
    title_elem = story.select_one('td.title a')
    title = ftfy.fix_text(title_elem.text)
    link = title_elem['href']

    if link.startswith('item'):
        link = f"{hn}{link}"

    # Extract comment URL and count
    subtext_elem = story.find_next_sibling('tr')
    subline_elem = subtext_elem.select_one('span.subline')
    if subline_elem:
        username_elem = subline_elem.select_one('a.hnuser')
        username = ftfy.fix_text(username_elem.text).strip()
        userlink = f"{hn}{username_elem['href']}"

        datetime = subline_elem.select_one('span.age')['title']
        story_score_elem = subline_elem.select_one('span.score')
        score = ftfy.fix_text(story_score_elem.text).replace(' points','')

        comment_url_elem = subline_elem.select_one('a:last-child')
        comment_url = f"{hn}{comment_url_elem['href']}"
    else:
        username = ""
        userlink = ""
        score = 0
        datetime = subtext_elem.select_one('span.age')['title']
        comment_url = ""

    # Insert stories
    query = """
            INSERT INTO stories
            (title, datetime, link, score, comment_url, username, userlink)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT(link) DO UPDATE SET
                score = excluded.score
    """

    conn.execute(query, (title, datetime, link, score, comment_url, username, userlink))

disconnect_from_db(conn, c)
