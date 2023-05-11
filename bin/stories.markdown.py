#!/usr/bin/env python3

import os
from dbc import *

conn = connect_to_db(os.environ['PSQLURL'])
c = conn.cursor()

query = f"""
    SELECT FORMAT('- [%s](%s)\n    - %s points // [comments](%s)',
                  title, link, score, comment_url)
    FROM stories

    WHERE datetime
    BETWEEN current_date - interval '1 day'
    AND current_date

    ORDER BY score DESC, datetime DESC
    LIMIT 30;
"""

c.execute(query)
rows = c.fetchall()

for row in rows:
    print(row[0])

disconnect_from_db(conn, c)
