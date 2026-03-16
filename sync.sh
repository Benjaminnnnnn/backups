#!/bin/zsh
DIR_PATH=$(dirname "$0")
/usr/local/bin/fswatch -o $HOME/.zshrc $HOME/.zsh/ $HOME/.tmux.conf $HOME/.config/nvim/ $HOME/.config/alacritty/ $HOME/.config/starship.toml $HOME/.config/yazi/ $HOME/.config/ghostty/ | xargs -n1 zsh $DIR_PATH/commit-changes.sh
