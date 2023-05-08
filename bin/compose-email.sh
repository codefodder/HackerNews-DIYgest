#!/usr/bin/env sh

current_hour=$(date +%H)

if [ ! $current_hour -eq 8 ]; then
  echo "Skip Email"
else
  echo "SEND_MAIL=true" >> "$GITHUB_ENV"
fi

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
     <div class="hacker-news-diygest-content">
       <h1 class="hacker-news-diygest-title">HackerNews DIYgest</h1>
       <p class="delivery-date">${SEND_TIME}</p>
       ${STORIES}
       <p class="footnote">View the <a href="https://github.com/codefodder/HackerNews-DIYgest">project</a> to set up your own HackerNews DIYgest.</p>
     </div>
  </body>
</html>
HTML
