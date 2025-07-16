#!/usr/bin/env bash

export TIMEZONE="Asia/Bangkok"

# We assume the python requirements are already available.
# PSQLURL should be defined in the environment (.env/autoenv)
# Mustache should be available
# Markdown should be available (pulldown-cmark)

PRJ_ROOT="$(git rev-parse --show-toplevel)"

export GITHUB_ENV="${PRJ_ROOT}/github.env"
[[ -e "$GITHUB_ENV" ]] && rm "$GITHUB_ENV"
touch "$GITHUB_ENV"

export GITHUB_STEP_SUMMARY="${PRJ_ROOT}/github_step_summary.log"
[[ -e "$GITHUB_STEP_SUMMARY" ]] && rm "$GITHUB_STEP_SUMMARY"
touch "$GITHUB_STEP_SUMMARY"

uv run --with ftfy $PRJ_ROOT/bin/hn-hourly-scrape-pg.py
$PRJ_ROOT/bin/stories.markdown.sh >> "$GITHUB_STEP_SUMMARY"
$PRJ_ROOT/bin/compose-subject-line.sh
$PRJ_ROOT/bin/compose-email.sh

# Use github env
source "$GITHUB_ENV"
echo "SUBJECT_LINE: $SUBJECT_LINE"

uv run --with ftfy bin/email-send.py "$SUBJECT_LINE"

$PRJ_ROOT/bin/summary.sh
# $PRJ_ROOT/bin/cleanup.sh
