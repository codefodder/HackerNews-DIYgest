#!/usr/bin/sh

psql -A -q -t $PSQLURL <<HERE
    SET client_encoding TO 'UTF8';

    SELECT json_agg(row_to_json(stories)) AS stories_json
    FROM (
      SELECT title, link, score, comment_url
      FROM stories

      WHERE datetime
      BETWEEN current_date - interval '1 day'
      AND current_date

      ORDER BY score DESC, datetime DESC
      LIMIT 30
    ) AS stories;
HERE
