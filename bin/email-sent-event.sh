#!/bin/sh

if [[ $SEND_MAIL == "true" ]]; then
psql $PSQLURL <<HERE
    INSERT INTO event_log (event, value)
    VALUES ('emailSent', '$1');
HERE
else
    echo "Email not sent on this run"
fi
