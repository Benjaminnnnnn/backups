#!/bin/zsh

# fzf
IGNORED_FILES=!{.git,node_modules}
# export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob $(!{.git,node_modules}) --ignore-file $HOME/.gitignore"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob $IGNORED_FILES --ignore-file $HOME/.gitignore"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always --theme=OneHalfDark {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
