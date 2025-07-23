#!/bin/bash

if [[ -z $PSQLURL ]];then
    echo "PSQLURL not in env"
    exit 1
fi

psql -tAq $PSQLURL <<HERE
    SET client_encoding TO 'UTF8';

    SELECT
    format(
        E'%4s. %s\n      %s\n      %s points // %s\n',
        ROW_NUMBER()
        OVER (ORDER BY score DESC, datetime DESC),
        title,
        link,
        score,
        comment_url)

    FROM stories

    WHERE datetime
    BETWEEN current_date - interval '1 day'
    AND current_date

    ORDER BY score DESC, datetime DESC
    LIMIT 50;
HERE
