#!/bin/bash

source .env

if [[ -z $PSQLURL ]];then
    echo "PSQLURL not in env"
    exit 1
fi

psql -tAq $PSQLURL <<HERE
    SET client_encoding TO 'UTF8';

    SELECT title
    FROM stories

    WHERE datetime
    BETWEEN current_date - interval '1 day'
    AND current_date

    ORDER BY score DESC, datetime DESC
    LIMIT 3;
HERE
