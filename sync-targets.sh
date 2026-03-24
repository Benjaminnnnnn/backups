#!/bin/zsh

sync_targets() {
  add_file_target "$HOME/.tmux.conf" "./tmux/.tmux.conf"

  add_file_target "$HOME/.zshrc" "./zsh/.zshrc"
  add_watch_path "$HOME/.zsh/"
  add_dir_target "$HOME/.zsh" "./zsh" \
    --include '*/' \
    --include '*.sh' \
    --exclude '*'

  add_dir_target "$HOME/.config/nvim" "./nvim" \
    --exclude '.git/' \
    --exclude '.github/' \
    --exclude '.gitignore'

  add_file_target "$HOME/.config/alacritty/alacritty.toml" "./alacritty/alacritty.toml"
  add_file_target "$HOME/.config/starship.toml" "./starship/starship.toml"
  add_dir_target "$HOME/.config/yazi" "./yazi"
  add_file_target "$HOME/.config/ghostty/config" "./ghostty/config"
}
