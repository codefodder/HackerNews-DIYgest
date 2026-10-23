#!/bin/bash

source .env

SQLITE_PATH="${HNDB_SQLITE:-/mnt/Mira/hndb/hnstories.sqlite3}"

if [[ ! -f "$SQLITE_PATH" ]]; then
    echo "SQLite database not found: $SQLITE_PATH"
    exit 1
fi

sqlite3 -noheader "$SQLITE_PATH" <<'SQL'
SELECT title
FROM stories
WHERE datetime BETWEEN
    CAST(strftime('%s', 'now', 'start of day', '-1 day') AS INTEGER)
    AND CAST(strftime('%s', 'now', 'start of day') AS INTEGER)
ORDER BY score DESC, datetime DESC
LIMIT 3;
SQL
