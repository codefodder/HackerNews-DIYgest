#!/usr/bin/env bash

export TIMEZONE="Asia/Bangkok"

# We assume the python requirements are already available.
# see requirements.txt
#
# PSQLURL should be defined in the environment (.env/autoenv)
#
# Mustache should be available
#
# Markdown should be available
#

PRJ_ROOT="$(git rev-parse --show-toplevel)"

export GITHUB_ENV="${PRJ_ROOT}/github.env"
[[ -e "$GITHUB_ENV" ]] && rm "$GITHUB_ENV"
touch "$GITHUB_ENV"

export GITHUB_STEP_SUMMARY="${PRJ_ROOT}/github_step_summary.log"
[[ -e "$GITHUB_STEP_SUMMARY" ]] && rm "$GITHUB_STEP_SUMMARY"
touch "$GITHUB_STEP_SUMMARY"

$PRJ_ROOT/bin/hn-hourly-scrape-pg.py
$PRJ_ROOT/bin/stories.markdown.sh >> "$GITHUB_STEP_SUMMARY"
$PRJ_ROOT/bin/compose-subject-line.sh
$PRJ_ROOT/bin/compose-email.sh

# Use github env
source "$GITHUB_ENV"

echo "SUBJECT_LINE: $SUBJECT_LINE"

##     subject: ${{ env.SUBJECT_LINE }}
##     from: HackerNews DIYgest
##     to: ${{secrets.EMAIL_RECIPIENT}}
##     username: ${{secrets.GMAIL_USER}}
##     password: ${{secrets.GM_APPWRD}}
##     body: file://digest.plaintext
##     html_body: file://digest.html
##     server_address: smtp.gmail.com
##     server_port: 465
##     secure: true
##     ignore_cert: true
##     priority: high
##
