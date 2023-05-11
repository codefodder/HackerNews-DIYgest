#!/usr/bin/env python3

import os
from dbc import *

conn = connect_to_db(os.environ(['PSQLURL']))
c = conn.cursor()


# INSERT INTO event_log (date_string, event_name)
# VALUES ('20230511', 'emailSentEvent');
