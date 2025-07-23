#!/usr/bin/env bash

set -e
cd ~/workspace/HackerNews-DIYgest
export PATH="$HOME/.local/bin:$PATH"

# Load .env line by line, safely
set -o allexport
if [ -f .env ]; then
  while IFS='=' read -r key val; do
    [[ "$key" =~ ^#.*$ || -z "$key" ]] && continue
    export "$key=$val"
  done < .env
fi
set +o allexport

exec "$@"
