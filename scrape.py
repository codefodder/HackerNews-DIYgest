#!/usr/bin/env python3

import requests
import ftfy
import sqlite3

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

# Send a request to the URL
hn = "https://news.ycombinator.com/"
res = requests.get(hn)
# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(res.text, 'html.parser')

# Extract the metadata for all stories using the provided selectors
stories = soup.select('tr.athing')
counter = 0

print("Adding stories daily to hn database.")

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
        username=ftfy.fix_text(username_elem.text)
        userlink=f"{hn}{username_elem['href']}"

        story_score_elem = subline_elem.select_one('span.score')
        score= ftfy.fix_text(story_score_elem.text)

        comment_url_elem = subline_elem.select_one('a:last-child')
        comment_url = f"{hn}{comment_url_elem['href']}"
        comment_count = ftfy.fix_text(comment_url_elem.text)
    else:
        username = ""
        userlink = ""
        score = 0
        comment_url = ""
        comment_count = 0


    print(f"""
    {title}
    """
    # Define the query
    query = """
        INSERT INTO stories
        (title, link, score, comment_url, comment_count, username, userlink)
        VALUES (?, ?, ?, ?, ?, ?, ?)
        ON CONFLICT(link) DO UPDATE SET
            score = excluded.score,
            comment_count = excluded.comment_count
    """

    conn.execute(query, (title, link, score, comment_url, comment_count, username, userlink))

disconnect_from_db(conn)
