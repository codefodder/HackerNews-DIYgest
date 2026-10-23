# /// script
# dependencies = ['ftfy', 'beautifulsoup4', 'requests', 'python-dotenv']
# ///

import os
import sqlite3
from datetime import datetime as datetime_module
from pathlib import Path

import ftfy
import requests
from dotenv import load_dotenv
from bs4 import BeautifulSoup

load_dotenv()

SQLITE_PATH = Path(
    os.environ.get("HNDB_SQLITE", "/mnt/Mira/hndb/hnstories.sqlite3")
).resolve()


def create_schema(conn):
    conn.executescript("""
        PRAGMA foreign_keys = ON;

        CREATE TABLE IF NOT EXISTS stories (
            id INTEGER PRIMARY KEY,
            title TEXT,
            datetime INTEGER,
            link TEXT UNIQUE,
            score INTEGER,
            comment_url TEXT,
            username TEXT,
            userlink TEXT
        );

        CREATE TABLE IF NOT EXISTS tags (
            id INTEGER PRIMARY KEY,
            name TEXT UNIQUE NOT NULL
        );

        CREATE TABLE IF NOT EXISTS story_tags (
            story_id INTEGER NOT NULL
                REFERENCES stories(id) ON DELETE CASCADE,
            tag_id INTEGER NOT NULL
                REFERENCES tags(id) ON DELETE CASCADE,
            PRIMARY KEY (story_id, tag_id)
        );
    """)

    conn.executemany(
        """
        INSERT INTO tags (name)
        VALUES (?)
        ON CONFLICT(name) DO NOTHING;
        """,
        [("favorite",), ("duplicate",)],
    )


def parse_hn_timestamp(value):
    """Convert Hacker News timestamps to Unix epoch seconds."""
    if not value:
        raise ValueError("Missing Hacker News timestamp")

    # Older format:
    # 2024-10-23T08:13:47 1729753343
    if " " in value:
        parts = value.split()
        epoch = parts[-1]

        if epoch.isdigit():
            return int(epoch)

    # Newer ISO-8601 format:
    # 2026-08-29T06:06:51.000000Z
    parsed = datetime_module.fromisoformat(
        value.replace("Z", "+00:00")
    )

    # Treat naive timestamps as UTC if one is ever encountered.
    if parsed.tzinfo is None:
        parsed = parsed.replace(
            tzinfo=datetime_module.now().astimezone().tzinfo
        )

    return int(parsed.timestamp())


def scrape_hacker_news(conn):
    hn = "https://news.ycombinator.com/"

    print(f"Read from {hn}")

    response = requests.get(
        hn,
        timeout=30,
        headers={"User-Agent": "HNStoryArchiver/1.0"},
    )
    response.raise_for_status()

    soup = BeautifulSoup(response.text, "html.parser")
    stories = soup.select("tr.athing")

    print("HackerNews Scrape/Hourly: adding stories to SQLite...")

    inserted_or_updated = 0

    for story in stories:
        title_elem = story.select_one("td.title a")

        if title_elem is None:
            continue

        title = ftfy.fix_text(title_elem.get_text()).strip()
        link = title_elem.get("href", "").strip()

        if not link:
            continue

        if link.startswith("item"):
            link = f"{hn}{link}"

        subtext_elem = story.find_next_sibling("tr")

        if subtext_elem is None:
            continue

        subline_elem = subtext_elem.select_one("span.subline")

        # Extract timestamp.
        age_elem = subtext_elem.select_one("span.age")

        if age_elem is None:
            print(f"Skipping story with no timestamp: {title}")
            continue

        try:
            timestamp = parse_hn_timestamp(age_elem.get("title", ""))
        except (ValueError, TypeError, OverflowError) as exc:
            print(f"Skipping story with invalid timestamp: {title}: {exc}")
            continue

        username = ""
        userlink = ""
        score = 0
        comment_url = ""

        if subline_elem:
            # Extract username and profile URL.
            username_elem = subline_elem.select_one("a.hnuser")

            if username_elem:
                username = ftfy.fix_text(
                    username_elem.get_text()
                ).strip()

                profile_href = username_elem.get("href", "")

                if profile_href:
                    userlink = f"{hn}{profile_href}"

            # Extract score.
            score_elem = subline_elem.select_one("span.score")

            if score_elem:
                score_text = (
                    ftfy.fix_text(score_elem.get_text())
                    .replace(" points", "")
                    .strip()
                )

                try:
                    score = int(score_text)
                except ValueError:
                    score = 0

            # Find the comments link without depending on child positions.
            for anchor in subline_elem.select("a"):
                label = anchor.get_text(" ", strip=True).lower()

                if "comment" in label:
                    href = anchor.get("href", "")

                    if href:
                        comment_url = f"{hn}{href}"

                    break

        print(
            f"{title} :: {link} :: {timestamp} :: score: {score}"
        )

        conn.execute(
            """
            INSERT INTO stories (
                title,
                datetime,
                link,
                score,
                comment_url,
                username,
                userlink
            )
            VALUES (?, ?, ?, ?, ?, ?, ?)
            ON CONFLICT(link) DO UPDATE SET
                score = excluded.score
            """,
            (
                title,
                timestamp,
                link,
                score,
                comment_url,
                username,
                userlink,
            ),
        )

        inserted_or_updated += 1

    print(f"Processed {inserted_or_updated} stories.")


def main():
    # Never create the database file if it is missing.
    if not SQLITE_PATH.is_file():
        raise FileNotFoundError(
            f"SQLite database does not exist: {SQLITE_PATH}"
        )

    print(f"Using SQLite database: {SQLITE_PATH}")

    # mode=rw prevents SQLite from creating a missing database.
    conn = sqlite3.connect(
        f"{SQLITE_PATH.as_uri()}?mode=rw",
        uri=True,
    )

    try:
        # Enable foreign key enforcement on this connection.
        conn.execute("PRAGMA foreign_keys = ON")

        create_schema(conn)
        scrape_hacker_news(conn)

        conn.commit()
        print("Changes committed successfully.")

    except Exception:
        conn.rollback()
        raise

    finally:
        conn.close()


if __name__ == "__main__":
    main()
