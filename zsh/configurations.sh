#!/bin/zsh

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always --theme=OneHalfDark {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
