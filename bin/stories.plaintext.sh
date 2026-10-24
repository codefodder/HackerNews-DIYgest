#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")/.."

python3 - <<'PY'
import os
import sqlite3
from pathlib import Path

db_path = Path(
    os.environ.get("HNDB_SQLITE", "/mnt/Mira/hndb/hnstories.sqlite3")
).resolve()

if not db_path.is_file():
    raise FileNotFoundError(f"SQLite database does not exist: {db_path}")

conn = sqlite3.connect(f"{db_path.as_uri()}?mode=ro", uri=True)

try:
    rows = conn.execute("""
        SELECT
            ROW_NUMBER() OVER (
                ORDER BY score DESC, datetime DESC
            ) AS number,
            title,
            link,
            score,
            comment_url
        FROM stories
        WHERE datetime BETWEEN
            CAST(strftime('%s', 'now', 'start of day', '-1 day') AS INTEGER)
            AND
            CAST(strftime('%s', 'now', 'start of day', '+1 day') AS INTEGER) - 1
        ORDER BY score DESC, datetime DESC
        LIMIT 50
    """).fetchall()

    for number, title, link, score, comment_url in rows:
        print(f"{number:4}. {title}")
        print(f"      {link}")
        print(f"      {score} points // {comment_url}")
        print()
finally:
    conn.close()
PY
