#!/bin/zsh
set -euo pipefail

DIR_PATH=$(cd -- "$(dirname "$0")" && pwd)
PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
FSWATCH_BIN=$(command -v fswatch || true)
WATCH_PATHS=()

add_watch_path() {
  WATCH_PATHS+=("$1")
}

add_file_target() {
  add_watch_path "$1"
}

add_dir_target() {
  add_watch_path "$1"
}

if [[ -z "$FSWATCH_BIN" ]]; then
  echo "fswatch not found in PATH: $PATH" >&2
  exit 1
fi

source "$DIR_PATH/sync-targets.sh"
sync_targets

"$FSWATCH_BIN" -o \
  "${WATCH_PATHS[@]}" | xargs -n1 zsh "$DIR_PATH/commit-changes.sh"
