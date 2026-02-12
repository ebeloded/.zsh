#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_FILE="${SCRIPT_DIR}/periodic_updates.log"
exec > >(tee -a "$LOG_FILE") 2>&1

PATH="/usr/bin:/bin"
BUN_BIN="/Users/ebeloded/.bun/bin/bun"

if [ -z "$BUN_BIN" ] || [ ! -x "$BUN_BIN" ]; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') bun not found; skipping updates"
  exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Starting periodic updates with $BUN_BIN"
"$BUN_BIN" update -g
echo "$(date '+%Y-%m-%d %H:%M:%S') Finished periodic updates"
