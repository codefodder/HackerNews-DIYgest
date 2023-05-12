#!/bin/sh

psql $PSQLURL <<HERE
    INSERT INTO event_log (event, value)
    VALUES ('emailSent', '$1');
HERE
