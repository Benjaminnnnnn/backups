#!/bin/zsh
DIR_PATH=`dirname "$0"`
/usr/local/bin/fswatch -o $HOME/.zshrc $HOME/.zsh/ $HOME/.tmux.conf | xargs -n1 zsh $DIR_PATH/commit-changes.sh
