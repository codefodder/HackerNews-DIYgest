#!/usr/bin/env sh

current_hour=$(date +%H)

if [ ! $current_hour -eq 8 ]; then
  echo "Skip Email"
else
  echo "SEND_MAIL=true" >> "$GITHUB_ENV"

  sqlite3 hn.db < stories.sql > stories.md
  markdown < stories.md > stories.html

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
       <div class=\"hacker-news-diygest-content\">
         <h1>HackerNews DIYgest</h1>
         <p class=\"delivery-date\">$(TZ=Asia/Bangkok date "+Compiled on %Y-%m-%d at %H:%M:%S (Bangkok time)")</p>
         $(cat stories.html)
         <p class=\"footnote\">Set up your own HackerNews DIYgest. TODO</p>
       </div>
    </body>
  </html>" > digest.html

  echo "Prepared Email"
fi
