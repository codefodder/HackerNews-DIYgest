-- formatted top 30 stories of today
.mode json

SELECT
    ROW_NUMBER() OVER (ORDER BY
        CAST(REPLACE(score,' points','') AS INTEGER) DESC,
        CAST(SUBSTR(datetime, 1, 10) AS INTEGER) DESC
    ) AS number,
    title,
    link,
    score,
    comment_url
FROM stories

WHERE datetime(datetime, '+7 hours')

BETWEEN
date('now', '-1 day', '+7 hours')
AND
date('now', 'start of day', '+7 hours')

ORDER BY number ASC
  -- CAST(REPLACE(score,' points','') AS INTEGER) DESC,
  -- CAST(SUBSTR(datetime, 1, 10) AS INTEGER) DESC

LIMIT 30;
