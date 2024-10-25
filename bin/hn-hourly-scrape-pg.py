#!/usr/bin/env python3

import os
import ftfy
import requests

from dbc import connect_to_db, disconnect_from_db
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
    score INTEGER,
    comment_url TEXT,
    username VARCHAR(255),
    userlink TEXT);
""")

c.execute("""
CREATE TABLE IF NOT EXISTS event_log (
   id SERIAL PRIMARY KEY,
   value VARCHAR(255),
   event VARCHAR(255),
   datetime TIMESTAMP DEFAULT NOW());
""")

c.execute("""
    CREATE TABLE IF NOT EXISTS tags (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) UNIQUE NOT NULL
    );
""")

# Create the story_tags table if it does not exist
c.execute("""
    CREATE TABLE IF NOT EXISTS story_tags (
        story_id INT NOT NULL,
        tag_id INT NOT NULL,
        PRIMARY KEY (story_id, tag_id),
        FOREIGN KEY (story_id) REFERENCES stories(id) ON DELETE CASCADE,
        FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
    );
""")

# Insert base tags if they don't already exist
base_tags = ['favorite', 'duplicate']
for tag in base_tags:
    c.execute("""
        INSERT INTO tags (name) VALUES (%s)
        ON CONFLICT (name) DO NOTHING;
    """, (tag,))

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
    subline_elem_2 = subtext_elem.select_one('span.subline:nth-child(1)')
    if subline_elem:
        username_elem = subline_elem.select_one('a.hnuser')
        username = ftfy.fix_text(username_elem.text).strip()
        userlink = f"{hn}{username_elem['href']}"

        datetime = subline_elem.select_one('span.age')['title']
        story_score_elem = subline_elem.select_one('span.score')
        score = ftfy.fix_text(story_score_elem.text).replace(' points', '')

        comment_url_elem = subline_elem_2.select_one('a:nth-child(6)')
        comment_url = f"{hn}{comment_url_elem['href']}"
    else:
        username = ""
        userlink = ""
        score = 0
        datetime = subtext_elem.select_one('span.age')['title']
        
    # datetime content changed on 24-10-2024 
    # It became a dual: ISO8601 DateTime string & Unix Epoch Seconds with 
    # a space separator between the two. e.g. 2024-10-23T08:13:47 1729753343
    #
    # We'll process the date using a check and favor the Epoch Seconds
    datetime = datetime.split(' ').pop() # Pop the epoch seconds
    comment_url = ""

    # Insert stories
    query = """
            INSERT INTO stories
            (title, datetime, link, score, comment_url, username, userlink)
            VALUES (%s, to_timestamp(%s), %s, %s, %s, %s, %s)
            ON CONFLICT(link) DO UPDATE SET
                score = excluded.score
    """

    conn.execute(
        query,
        (title, datetime, link, score, comment_url, username, userlink)
    )

disconnect_from_db(conn, c)
