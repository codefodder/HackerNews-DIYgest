#!/usr/bin/env sh

bin/compose-data.sh
cat digest.json | mustache mustache/hackernews.diygest.mustache.html > digest.html

cat <<HERE > digest.plaintext
HackerNews top 50 stories of ${prettydate}

$(bin/stories.plaintext.sh)

Generated at ${exactdatetime} - https://github.com/codefodder/HackerNews-DIYgest
HERE
