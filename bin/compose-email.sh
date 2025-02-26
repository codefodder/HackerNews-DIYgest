#!/usr/bin/env sh

# generate digest.json
bin/compose-data.sh

mustache mustache/hackernews.diygest.mustache.html < digest.json > digest.html

cat <<HERE > digest.plaintext
HackerNews top 50 stories of ${prettydate}

$(bin/stories.plaintext.sh)

Generated at ${exactdatetime} - https://github.com/codefodder/HackerNews-DIYgest
HERE
