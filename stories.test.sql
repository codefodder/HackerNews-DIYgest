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

ORDER BY number ASC

LIMIT 30;
