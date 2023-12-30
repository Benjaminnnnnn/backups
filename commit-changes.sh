#!/bin/zsh
cd $(dirname "$0")

# tmux config
cp $HOME/.tmux.conf ./tmux/

# nvim config
cp -rf $HOME/.config/nvim/* ./nvim/
rm -rf ./nvim/.git ./nvim/.github ./nvim/.gitignore

# zsh config
cp $HOME/.zshrc ./zsh/
cp -r $HOME/.zsh/* ./zsh/

# alacritty config
cp -rf $HOME/.config/alacritty/ ./alacritty/

# sync
git add .
git commit -m "Sync configs"
git push origin
