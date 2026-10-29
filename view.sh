#!/usr/bin/env bash
# Preview the site locally. Usage: ./view.sh [port]
set -euo pipefail

port="${1:-8000}"
url="http://localhost:${port}/"
cd "$(dirname "$0")/docs"

# Open the browser once the server has had a moment to start.
( sleep 1
  if command -v open >/dev/null; then open "$url"
  elif command -v xdg-open >/dev/null; then xdg-open "$url"
  fi ) &

echo "Serving docs/ at $url (Ctrl+C to stop)"
exec python3 -m http.server "$port"
