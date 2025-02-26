#!/usr/bin/env bash

export TARGET_HOUR="08"
export TIMEZONE="Asia/Bangkok"
export inputs_send_email="no thanks"

# We assume the python requirements are already available.
# see requirements.txt
#
# PSQLURL should be defined in the environment
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

$PRJ_ROOT/bin/check-email-condition.sh

# Use github env
source "$GITHUB_ENV"

echo "SUBJECT_LINE: $SUBJECT_LINE"
echo "SEND_MAIL: $SEND_MAIL"

if [[ $SEND_MAIL == "true" ]]; then
    # send email...
    echo "Sending email TODO"
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
    if [[ $EMAIL_SUCCESS == "yes" ]]; then
       # today=$(TZ=$TIMEZONE date +%Y%m%d) bin/email-sent-event.sh $today
       echo "Email success event recorded TODO"
    fi
else
    echo "Not sending email for this run"
fi
