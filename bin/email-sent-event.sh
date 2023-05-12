#!/bin/bash

if [[ "$SEND_MAIL" == "true" ]]; then
    echo "emailSent - event logged"
psql $PSQLURL <<HERE
    INSERT INTO event_log (event, value)
    VALUES ('emailSent', '$1');
HERE
else
    echo "Email not sent on this run"
fi
