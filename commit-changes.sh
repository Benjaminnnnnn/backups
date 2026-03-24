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

# tmux config
sync_file "$HOME/.tmux.conf" "./tmux/.tmux.conf"

# nvim config
sync_directory "$HOME/.config/nvim" "./nvim" \
  --exclude '.git/' \
  --exclude '.github/' \
  --exclude '.gitignore'

# zsh config
sync_file "$HOME/.zshrc" "./zsh/.zshrc"
/usr/bin/rsync -a --delete \
  --include '*/' \
  --include '*.sh' \
  --exclude '*' \
  "$HOME/.zsh"/ "./zsh"/

# alacritty config
sync_file "$HOME/.config/alacritty/alacritty.toml" "./alacritty/alacritty.toml"

# starship config
sync_file "$HOME/.config/starship.toml" "./starship/starship.toml"

# yazi config
sync_directory "$HOME/.config/yazi" "./yazi"

# ghostty config
sync_file "$HOME/.config/ghostty/config" "./ghostty/config"

git add .

if git diff --cached --quiet; then
  exit 0
fi

git commit -m "Fix config sync scripts"
git push origin main
