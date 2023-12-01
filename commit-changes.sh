#!/bin/zsh
cd $(dirname "$0")

# tmux config
cp $HOME/.tmux.conf ./tmux/

# nvim config
cp -rf $HOME/.config/nvim/* ./nvim/
rm -rf ./nvim/.git .nvim/.github

# zsh config
cp $HOME/.zshrc ./zsh/
cp -r $HOME/.zsh/* ./zsh/
git add .
git commit -m "Sync configs"
git push origin
