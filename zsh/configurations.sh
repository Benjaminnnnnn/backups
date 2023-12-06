#!/bin/zsh

# fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob !.git --glob !node_modules --ignore-file $HOME/.gitignore"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always --theme=OneHalfDark {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)' 2&>/dev/null"
