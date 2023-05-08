SELECT "- [" || title || "](" || link || ")
    - " || score || " [comments]("|| comment_url || ")"
FROM stories

WHERE datetime(datetime, '+7 hours')

BETWEEN
date('now', '-1 day', '+7 hours')
AND
date('now', 'start of day', '+1 day', '+7 hours')

ORDER BY
  CAST(REPLACE(score,' points','') AS INTEGER) DESC,
  CAST(SUBSTR(datetime, 1, 10) AS INTEGER) DESC

LIMIT 30;
