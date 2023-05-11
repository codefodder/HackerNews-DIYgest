#!/usr/bin/env python3

import os
import sys
import ftfy
import requests
import dbc

import select
from bs4 import BeautifulSoup

def connect_to_db(url):
    # Connect to PostgreSQL database
    pg_conn = psycopg.connect(url)
    pg_cursor = pg_conn.cursor()
    return pg_conn

def disconnect_from_db(connection, cursor):
    # commit changes and close the database connection
    connection.commit()
    cursor.close()
    connection.close()

conn = connect_to_db(os.environ['PSQLURL'])
c = conn.cursor()

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

    if username:
        print(f"{title} ({username})")
    else:
        print(f"{title} (YC)")

    print(link)

    # Define the query
    query = """
            INSERT INTO stories
            (title, datetime, link, score, comment_url, username, userlink)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT(link) DO UPDATE SET
                score = excluded.score,
                comment_count = excluded.comment_count
    """

    conn.execute(query, (title, datetime, link, score, comment_url, username, userlink))

disconnect_from_db(conn, c)