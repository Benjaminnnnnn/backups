#!/bin/zsh
cd $(dirname "$0")

# zsh config
cp $HOME/.zshrc ./zsh/
cp -r $HOME/.zsh/* ./zsh/
git add .
git commit -m "Sync configs"
git push origin
