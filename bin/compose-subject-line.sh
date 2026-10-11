#!/usr/bin/env bash

SUBJECT_LINE=$(bin/top-3-titles.sh |
    PERL_UNICODE=SAL \
    perl -pe 'chomp; if (not eof) { s/$/ \x{2014} / }' |
    perl -CSD -pe 's/['\''"`‘’‚‛“”„‟«»‹›「」『』【】〝〞〟]//g')

echo "GitHub env file: $GITHUB_ENV"
printf 'SUBJECT_LINE="HackerNews DIYgest — %s"\n' "$SUBJECT_LINE" >> "$GITHUB_ENV"
