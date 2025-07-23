#!/usr/bin/env bash

export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH
export TIMEZONE="Asia/Bangkok"
SCRIPT_DIR=$(dirname $0)


# We assume the python requirements are already available.
# PSQLURL should be defined in the environment (.env/autoenv)
# Mustache should be available
# Markdown should be available (pulldown-cmark)

PRJ_ROOT="$(git -C $SCRIPT_DIR rev-parse --show-toplevel)"

source $PRJ_ROOT/.env

export GITHUB_ENV="${PRJ_ROOT}/github.env"
[[ -e "$GITHUB_ENV" ]] && rm "$GITHUB_ENV"
touch "$GITHUB_ENV"

export GITHUB_STEP_SUMMARY="${PRJ_ROOT}/github_step_summary.log"
[[ -e "$GITHUB_STEP_SUMMARY" ]] && rm "$GITHUB_STEP_SUMMARY"
touch "$GITHUB_STEP_SUMMARY"

~/.local/bin/uv run --with ftfy $PRJ_ROOT/bin/hn-hourly-scrape-pg.py
$PRJ_ROOT/bin/stories.markdown.sh >> "$GITHUB_STEP_SUMMARY"
$PRJ_ROOT/bin/compose-subject-line.sh
$PRJ_ROOT/bin/compose-email.sh

# Use github env
source "$GITHUB_ENV"
echo "SUBJECT_LINE: $SUBJECT_LINE"

~/.local/bin/uv run $PRJ_ROOT/bin/email-send.py "$SUBJECT_LINE"

$PRJ_ROOT/bin/summary.sh
# $PRJ_ROOT/bin/cleanup.sh
