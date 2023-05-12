#!/bin/sh

output=$(psql -tA "$PSQLURL" <<HERE
    SELECT COUNT(*) FROM event_log
    WHERE value='$1'
HERE
)

# # Check the exit status of the previous command
# if [ "$?" -eq 0 ]; then
#   # If exit status is 0, set the env variable to true
#   echo "::set-env name=EVENT_FOUND::true"
# else
#   # If exit status is not 0, set the env variable to false
#   echo "::set-env name=EVENT_FOUND::false"
# fi

# Output the result of the psql command
echo "$output"
