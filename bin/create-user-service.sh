#!/usr/bin/env bash
set -e

mkdir -p ~/.config/systemd/user

cat <<EOF > ~/.config/systemd/user/hndiygest.service
[Unit]
Description=HackerNews DIYgest base service
Wants=network-online.target
After=network-online.target

[Service]
Type=oneshot
WorkingDirectory=%h/workspace/HackerNews-DIYgest
ExecStart=%f
StandardOutput=append:%h/.hacker-news-diygest.log
StandardError=inherit
EOF

cat <<EOF > ~/.config/systemd/user/hndiygest-hourly.service
[Unit]
Description=Run HackerNews scrape script

[Service]
Type=oneshot
WorkingDirectory=%h/workspace/HackerNews-DIYgest
ExecStart=%h/.local/bin/uv run %h/workspace/HackerNews-DIYgest/bin/hn-hourly-scrape-pg.py
EOF

cat <<EOF > ~/.config/systemd/user/hndiygest-hourly.timer
[Unit]
Description=Run hn-hourly-scrape-pg.py hourly

[Timer]
OnCalendar=hourly
Persistent=true

[Install]
WantedBy=timers.target
EOF

cat <<EOF > ~/.config/systemd/user/hndiygest-daily.service
[Unit]
Description=Run HackerNews digest email

[Service]
Type=oneshot
WorkingDirectory=%h/workspace/HackerNews-DIYgest
ExecStart=%h/workspace/HackerNews-DIYgest/bin/run_local.sh
EOF

cat <<EOF > ~/.config/systemd/user/hndiygest-daily.timer
[Unit]
Description=Run daily HN digest at 08:30

[Timer]
OnCalendar=*-*-* 08:30:00
Persistent=true

[Install]
WantedBy=timers.target
EOF

systemctl --user daemon-reexec
systemctl --user daemon-reload

systemctl --user enable --now hndiygest-hourly.timer
systemctl --user enable --now hndiygest-daily.timer

echo "✅ HackerNews DIYgest timers installed and running."
