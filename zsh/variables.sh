#!/bin/bash
#timerSelection[0].value; If you come from bash you might have to change your $PATH.
export PATH=/USR/LOCAL/opt/llvm/bin:/usr/local//Cellar/llvm/16.0.6/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:/Users/benjaminzhuang/go/bin
export PATH=$PATH:~/.bun/bin/
export PATH=$PATH:/Applications/Alacritty.app/Contents/MacOS
export PATH=$PATH:~/.local/bin
# export PATH=~/anaconda3/bin:$PATH:usr/local/bin:~/.local/bin
#         export PATH=export TERM=xterm-256color
export FORTUNE_FILE='/Users/benjaminzhuang/.fortune_file'

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export EDITOR=nvim
