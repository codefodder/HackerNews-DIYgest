#!/usr/bin/env sh

current_hour=$(date +%H)

if [ ! $current_hour -eq 8 ]; then
  echo "Skip Email"
else
  echo "SEND_MAIL=true" >> "$GITHUB_ENV"

  echo "
  # HackerNews DIYgest

  $(TZ=Asia/Bangkok date "+Compiled on %Y-%m-%d at %H:%M:%S (Bangkok time)")

  " > stories.md

  sqlite3 hn.db < stories.sql >> stories.md

  echo "

  Set up your own HackerNews DIYgest... TODO" >> stories.md

  cat stories.md | markdown > stories.html

  echo "
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset=\"UTF-8\">
      <style>
        $(cat css/style.css)
      </style>
    </head>
    <body>
       $(cat stories.html)
    </body>
  </html>" > digest.html

  echo "Prepared Email"
fi
