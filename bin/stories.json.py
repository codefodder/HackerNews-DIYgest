#!/usr/bin/env python3

import os
import json
from dbc import *

conn = connect_to_db(os.environ['PSQLURL'])
c = conn.cursor()

query = f"""
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
"""

c.execute(query)
result = c.fetchone()
json_result = result[0]

print(json.dumps(json_result, indent=4))

disconnect_from_db(conn, c)
