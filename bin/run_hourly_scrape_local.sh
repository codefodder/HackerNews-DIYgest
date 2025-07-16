#!/usr/bin/env bash

export TIMEZONE="Asia/Bangkok"
PRJ_ROOT="$(git rev-parse --show-toplevel)"
uv run --with ftfy $PRJ_ROOT/bin/hn-hourly-scrape-pg.py
