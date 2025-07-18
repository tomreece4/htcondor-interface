#!/usr/bin/env bash
# ── run-voila.sh ────────────────────────────────────────────────

# Change into the script’s directory
cd "$(dirname "$0")"

# Start the stack in detached mode
docker-compose up -d

# Give it a few seconds to spin up
sleep 5

# Open the web UI in the default browser
# xdg-open works on most Linux distros; fallback to 'open' if present
if ! xdg-open "http://localhost:8866/" >/dev/null 2>&1; then
  open "http://localhost:8866/" >/dev/null 2>&1 || true
fi

echo "Voilà is now running at http://localhost:8866/"
read -p "Press [Enter] to exit this window..."
