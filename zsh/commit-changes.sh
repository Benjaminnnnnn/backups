#!/bin/zsh
cd $(dirname "$0")
cp $HOME/.zshrc .
cp -r $HOME/.zsh/* .
git add .
git commit -m "Sync zsh configs"
git push origin
