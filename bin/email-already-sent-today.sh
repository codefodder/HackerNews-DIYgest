#!/bin/bash

source .env

if [[ -z $PSQLURL ]];then
    echo "PSQLURL not in env"
    exit 1
fi

output=$(
    psql -tA "$PSQLURL" <<HERE
        SELECT COUNT(*) FROM event_log
        WHERE value='$1'
HERE
)

echo "$output"
