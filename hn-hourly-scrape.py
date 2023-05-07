#!/usr/bin/env python3

import requests
import ftfy
import sqlite3
import sys
import select

from bs4 import BeautifulSoup

def connect_to_db(dbname):
    conn = sqlite3.connect(dbname)
    conn.execute('PRAGMA page_size=65536;') # Set the page size to 64KB
    conn.execute('PRAGMA cache_size=-8000000;') # Set the cache size to 8GB
    conn.execute('PRAGMA journal_mode=OFF;') # Disable journaling
    conn.execute('PRAGMA synchronous=OFF;') # Disable synchronous write
    return conn

def disconnect_from_db(connection):
    # commit changes and close the database connection
    connection.commit()
    connection.close()

def create_hn_table(c):
    c.execute('''
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
    ''')

conn = connect_to_db("hn.db")
c = conn.cursor()
create_hn_table(c)

hn = "https://news.ycombinator.com/"

# check stdin and read from that as priority.
if select.select([sys.stdin,],[],[],0.0)[0]:
    # There is data on stdin, so read it
    input_data = sys.stdin.read()
    data = input_data
    print("Read from stdin:")
else:
    # There is no input on stdin, so do the default action
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

    # Extract comment URL and count
    subtext_elem = story.find_next_sibling('tr')
    subline_elem = subtext_elem.select_one('span.subline')
    if subline_elem:
        username_elem = subline_elem.select_one('a.hnuser')
        username=ftfy.fix_text(username_elem.text).strip()
        userlink=f"{hn}{username_elem['href']}"

        datetime=subline_elem.select_one('span.age')['title']
        story_score_elem = subline_elem.select_one('span.score')
        score= ftfy.fix_text(story_score_elem.text)

        comment_url_elem = subline_elem.select_one('a:last-child')
        comment_url = f"{hn}{comment_url_elem['href']}"
        comment_count = ftfy.fix_text(comment_url_elem.text)
    else:
        username = ""
        userlink = ""
        score = 0
        datetime=subtext_elem.select_one('span.age')['title']
        comment_url = ""
        comment_count = 0


    if username:
        print(f"{title} ({username})")
    else:
        print(f"{title} (YC)")

    print(link)

    # Define the query
    query = """
        INSERT INTO stories
        (title, datetime, link, score, comment_url, comment_count, username, userlink)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count
    """

    conn.execute(query, (title, datetime, link, score, comment_url, comment_count, username, userlink))

disconnect_from_db(conn)
