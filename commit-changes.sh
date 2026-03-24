#!/bin/zsh
set -euo pipefail

cd -- "$(dirname "$0")"

sync_file() {
  local src="$1"
  local dest="$2"

  mkdir -p -- "$(dirname "$dest")"
  cp -- "$src" "$dest"
}

sync_directory() {
  local src="$1"
  local dest="$2"
  shift 2

  mkdir -p -- "$dest"
  /usr/bin/rsync -a --delete "$@" "$src"/ "$dest"/
}

add_watch_path() {
  :
}

add_file_target() {
  sync_file "$1" "$2"
}

add_dir_target() {
  sync_directory "$@"
}

source "./sync-targets.sh"
sync_targets

git add .

if git diff --cached --quiet; then
  exit 0
fi

git commit -m "Fix config sync scripts"
git push origin main
