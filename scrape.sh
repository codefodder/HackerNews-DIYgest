#!/bin/bash

# Define SQLite schema
sqlite3 hn_stories.db <<EOF
CREATE TABLE IF NOT EXISTS stories (
  id INTEGER PRIMARY KEY,
  title TEXT,
  url TEXT,
  comments_url TEXT,
  score INTEGER,
  comment_count INTEGER,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
EOF

# Extract data from HTML file and insert into database
cat hn.html | pup 'table.itemlist tr td.title a:first-of-type json{} + td.subtext > span:first-of-type json{} + span:last-of-type json{}' | jq -c '.[] | {title: .text, url: .href, comments_url: ("https://news.ycombinator.com/item?id=" + (.href | sub("/item\\?id="; ""))), score: ((. + " points") | tonumber), comment_count: ((. + " comments") | tonumber)}' | sort -u -k 2,2 | while read -r line
do
  title=$(echo "$line" | jq -r '.title')
  url=$(echo "$line" | jq -r '.url')
  comments_url=$(echo "$line" | jq -r '.comments_url')
  score=$(echo "$line" | jq -r '.score')
  comment_count=$(echo "$line" | jq -r '.comment_count')

  # Find the highest score for this story
  max_score=$(sqlite3 hn_stories.db "SELECT MAX(score) FROM stories WHERE url='$url';")

  # If the current score is higher, update the record
  if [ "$score" -gt "$max_score" ]; then
    sqlite3 hn_stories.db "INSERT OR REPLACE INTO stories (title, url, comments_url, score, comment_count) VALUES ('$title', '$url', '$comments_url', '$score', '$comment_count');"
  fi
done

# Remove HTML file
rm hn.html
