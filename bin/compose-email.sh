#!/usr/bin/env sh

current_hour=$(date +%H)

if [ ! $current_hour -eq 8 ]; then
  echo "Skip Email"
else
  echo "SEND_MAIL=true" >> "$GITHUB_ENV"
fi

SUBJECT_LINE=$(sqlite3 hn.db < top-3-titles.sql |
    PERL_UNICODE=SAL \
    perl -pe 'chomp; if (not eof) { s/$/ \x{2014} / }')
echo "SUBJECT_LINE=${SUBJECT_LINE}" >> "$GITHUB_ENV"

sqlite3 hn.db < stories.sql > stories.md
markdown < stories.md > stories.html

CSS=$(cat css/style.css)
STORIES=$(cat stories.html)
SEND_TIME=$(TZ=Asia/Bangkok date "+Compiled on %Y-%m-%d at %H:%M:%S (Bangkok time)")

cat <<HTML > digest.html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <style>
      ${CSS}
    </style>
  </head>
  <body>
     <div class="hnd-content">
       <p class="hnd-top-3-subject-lines"
       <h1
        class="hnd-title"
        style="font-family: 'Helvetica Neue', Helvetica, sans-serif;
               margin-top: 0.5em; margin-bottom: 0;
               font-weight: 900; font-size: 4em;
               line-height: 1; letter-spacing: -5px;">HackerNews DIYgest</h1>
       <p class="hnd-delivery-date">${SEND_TIME}</p>
       ${STORIES}
       <p class="hnd-footnote"><a href="https://github.com/codefodder/HackerNews-DIYgest">View the project</a> to set up your own <a href="https://github.com/codefodder/HackerNews-DIYgest">HackerNews DIYgest.</a></p>
     </div>
  </body>
</html>
HTML
