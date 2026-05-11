#!/bin/bash

HELIOS=${$1:-helios}

# Migrate hackernews database from helios to localhost
# Assumes $PSQLURL is set to postgres://hackernews:$PASSWD@localhost:5432/hackernews

# 1. Clear local database
sudo -u postgres psql -c "DROP DATABASE IF EXISTS hackernews;"
sudo -u postgres psql -c "CREATE DATABASE hackernews OWNER hackernews;"

# 2. Dump from helios and restore to local
SOURCE_URL=$(echo "$PSQLURL" | sed "s/localhost/$HELIOS/")
pg_dump "$SOURCE_URL" -Fc -f /tmp/hackernews.dump
sudo -u postgres pg_restore --dbname=hackernews /tmp/hackernews.dump

# 3. Fix schema ownership
sudo -u postgres psql -d hackernews -c "ALTER SCHEMA public OWNER TO hackernews;"

# 4. Clean up
rm /tmp/hackernews.dump

# 5. Verify
psql "$PSQLURL" -c "SELECT COUNT(*) FROM stories;"

# 6. Test scrape
uv run bin/hn-hourly-scrape-pg.py
