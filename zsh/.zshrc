# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("/Users/benjaminzhuang/.oh-my-zsh/custom/completions" $fpath)
# OPENSPEC:END

eval "$(/opt/homebrew/bin/brew shellenv)"
# load all configurations
for config in "$HOME/.zsh"/{variables,configurations,functions,others,aliases}.sh; do
  source "$config"
done


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerline"
ZSH_THEME=""

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux zsh-autosuggestions)

source "$ZSH/oh-my-zsh.sh"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

if (( $+commands[starship] )); then eval "$(starship init zsh)"; fi

export PATH="$HOME/.jenv/bin:$PATH"
# shortcut: jenv skips startup rehash, run jenv rehash after adding a Java version.
if (( $+commands[jenv] )); then eval "$(jenv init - --no-rehash zsh)"; fi

# load background
# 249 - Lugia
# 643 - Reshiram
# 717 - Yveltal
# pokemon 249
# pokemon 643
# pokemon 717

# login message
#fortune | cowpy -c dragonandcow | lolcat
#echo << ""

# bun completions
[ -s "/Users/benjaminzhuang/.bun/_bun" ] && source "/Users/benjaminzhuang/.bun/_bun"

if (( $+commands[zoxide] )); then eval "$(zoxide init zsh)"; fi
if (( $+commands[fzf] )); then source <(fzf --zsh); fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

typeset -U path
