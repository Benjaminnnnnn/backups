#!/bin/bash

RG_PREFIX="rg --files --hidden --follow --glob !.git --glob !node_modules --ignore-file $HOME/.gitignore --column --line-number --no-heading --color=always --smart-case"

# fzf
export FZF_DEFAULT_COMMAND="$RG_PREFIX 2>/dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always --theme=OneHalfDark {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)',ctrl-d:reload(rg -type d)"
