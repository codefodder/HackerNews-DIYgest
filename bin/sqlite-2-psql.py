#!/usr/bin/env python3.10

import sqlite3
import psycopg
import os

# Connect to SQLite database
sqlite_conn = sqlite3.connect(os.environ['HNDB'])
sqlite_cursor = sqlite_conn.cursor()

# Connect to PostgreSQL database
pg_conn = psycopg.connect(os.environ['PSQLURL'])
pg_cursor = pg_conn.cursor()

# Create table in PostgreSQL
pg_cursor.execute("""
CREATE TABLE IF NOT EXISTS stories (
    id SERIAL PRIMARY KEY,
    title VARCHAR(180),
    datetime TIMESTAMP,
    link TEXT UNIQUE,
    score INTEGER,
    comment_url TEXT,
    username TEXT,
    userlink TEXT
)
""")

# Construct SELECT statement for SQLite
sqlite_select = """
SELECT title, 
       REPLACE(datetime, 'T', ' ') AS datetime,
       link, 
       CAST(REPLACE(score, 'points ', '') AS INTEGER) AS score,
       comment_url, 
       username, 
       userlink
FROM stories
"""

# Execute SELECT statement on SQLite database
sqlite_cursor.execute(sqlite_select)
sqlite_results = sqlite_cursor.fetchall()

# Construct INSERT statement for PostgreSQL
pg_insert = """
INSERT INTO stories (title, datetime, link, score, comment_url, username, userlink)
VALUES (%s, %s, %s, %s, %s, %s, %s)
"""

# Execute INSERT statement on PostgreSQL database
pg_cursor.executemany(pg_insert, sqlite_results)

# Commit changes to PostgreSQL database
pg_conn.commit()

# Close connections
pg_cursor.close()
pg_conn.close()
sqlite_cursor.close()
sqlite_conn.close()
