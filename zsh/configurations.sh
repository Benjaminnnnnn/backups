#!/bin/bash

# fzf
RG_PREFIX="rg --files --hidden --follow --glob !.git --glob !node_modules --ignore-file $HOME/.gitignore --column --line-number --no-heading --smart-case"

export FZF_DEFAULT_COMMAND="$RG_PREFIX 2>/dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always --theme=Nord {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|),ctrl-d:reload(find . -type d),ctrl-f:reload(eval $FZF_DEFAULT_COMMAND)'"
