#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")/.."

python3 - <<'PY'
import json
import os
import sqlite3
from pathlib import Path

db_path = Path(
    os.environ.get("HNDB_SQLITE", "/mnt/Mira/hndb/hnstories.sqlite3")
).resolve()

if not db_path.is_file():
    raise FileNotFoundError(f"SQLite database does not exist: {db_path}")

conn = sqlite3.connect(f"{db_path.as_uri()}?mode=ro", uri=True)
conn.row_factory = sqlite3.Row

try:
    rows = conn.execute("""
        SELECT
            id,
            title,
            link,
            score,
            'https://news.ycombinator.com/item?id=' || id AS comment_url
            ROW_NUMBER() OVER (
                ORDER BY score DESC, datetime DESC
            ) AS number
        FROM stories
        WHERE datetime BETWEEN
            CAST(strftime('%s', 'now', 'start of day', '-1 day') AS INTEGER)
            AND
            CAST(strftime('%s', 'now', 'start of day', '+1 day') AS INTEGER) - 1
        ORDER BY score DESC, datetime DESC
        LIMIT 50
    """).fetchall()

    print(json.dumps([dict(row) for row in rows], ensure_ascii=False))
finally:
    conn.close()
PY
