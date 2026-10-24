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
        SELECT title, link, score, comment_url
        FROM stories
        WHERE datetime BETWEEN
            CAST(strftime('%s', 'now', 'start of day', '-1 day') AS INTEGER)
            AND
            CAST(strftime('%s', 'now', 'start of day', '+1 day') AS INTEGER) - 1
        ORDER BY score DESC, datetime DESC
        LIMIT 50
    """).fetchall()

    for title, link, score, comment_url in rows:
        print(f"- [{title}]({link})")
        print(f"    - {score} points // [comments]({comment_url})")
finally:
    conn.close()
PY
