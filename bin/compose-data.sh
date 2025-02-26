#!/usr/bin/env bash
stories=$(bin/stories.json.sh)
prettydate="$(TZ=$TIMEZONE date "+%A, %d %b %Y")"
exactdatetime="$(TZ=$TIMEZONE date "+%Y-%m-%d %H:%M:%S")"
echo "{\"stories\": ${stories}, \"prettydate\":\"${prettydate}\", \"exactdatetime\":\"${exactdatetime}\"}" > digest.json
