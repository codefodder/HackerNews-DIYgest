#!/usr/bin/sh

psql -A -q -t $PSQLURL <<HERE
    SET client_encoding TO 'UTF8';

    SELECT FORMAT('- [%s](%s)\n    - %s points // [comments](%s)',
                  title, link, score, comment_url)
    FROM stories

    WHERE datetime
    BETWEEN current_date - interval '1 day'
    AND current_date

    ORDER BY score DESC, datetime DESC
    LIMIT 30;
HERE
