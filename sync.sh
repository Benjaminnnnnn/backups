#!/bin/zsh
set -euo pipefail

DIR_PATH=$(cd -- "$(dirname "$0")" && pwd)
PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
FSWATCH_BIN=$(command -v fswatch || true)

if [[ -z "$FSWATCH_BIN" ]]; then
  echo "fswatch not found in PATH: $PATH" >&2
  exit 1
fi

"$FSWATCH_BIN" -o \
  "$HOME/.zshrc" \
  "$HOME/.zsh/" \
  "$HOME/.tmux.conf" \
  "$HOME/.config/nvim/" \
  "$HOME/.config/alacritty/" \
  "$HOME/.config/starship.toml" \
  "$HOME/.config/yazi/" \
  "$HOME/.config/ghostty/" | xargs -n1 zsh "$DIR_PATH/commit-changes.sh"
