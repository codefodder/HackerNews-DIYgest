#!/bin/sh

psql -tAq $PSQLURL <<HERE
    SET client_encoding TO 'UTF8';

    SELECT json_agg(row_to_json(stories)) AS stories_json
    FROM (
      SELECT id, title, link, score, comment_url,
             ROW_NUMBER() OVER (ORDER BY score DESC, datetime DESC) AS number
      FROM stories

      WHERE datetime
      BETWEEN current_date - interval '1 day'
      AND current_date

      ORDER BY score DESC, datetime DESC
      LIMIT 50
    ) AS stories;
HERE
