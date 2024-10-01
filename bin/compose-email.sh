#!/usr/bin/env sh
stories=$(bin/stories.json.sh)
prettydate="$(TZ=$TIMEZONE date "+%A, %d %b %Y")"
exactdatetime="$(TZ=$TIMEZONE date "+%Y-%m-%d %H:%M:%S")"

echo "{\"stories\": ${stories}, \"prettydate\":\"${prettydate}\", \"exactdatetime\":\"${exactdatetime}\"}" \
    | mustache mustache/hackernews.diygest.mustache.html > digest.html

cat <<HERE > digest.plaintext
HackerNews top 30 stories of ${prettydate}

$(bin/stories.plaintext.sh)

Generated at ${exactdatetime} - https://github.com/codefodder/HackerNews-DIYgest
HERE
