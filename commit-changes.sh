#!/bin/zsh
cd $(dirname "$0")

# tmux config
cp $HOME/.tmux.conf ./tmux/

# nvim config
cp -rf $HOME/.config/nvim/* ./nvim/
rm -rf ./nvim/.git ./nvim/.github ./nvim/.gitignore

# zsh config
cp $HOME/.zshrc ./zsh/
cp -r $HOME/.zsh/*.sh ./zsh/*.sh

# alacritty config
cp $HOME/.config/alacritty/alacritty.toml ./alacritty/alacritty.toml

# starship config
cp $HOME/.config/starship.toml ./starship/starship.toml

# sync
git add .
git commit -m "Sync configs"
git push origin
