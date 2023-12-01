# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#timerSelection[0].value; If you come from bash you might have to change your $PATH.
export PATH=/USR/LOCAL/opt/llvm/bin:/usr/local//Cellar/llvm/16.0.6/bin:$PATH
export PATH=$PATH:/Users/benjaminzhuang/go/bin
export PATH=$PATH:~/.bun/bin/
# export PATH=~/anaconda3/bin:$PATH:usr/local/bin:~/.local/bin
#         export PATH=export TERM=xterm-256color
export FORTUNE_FILE='/Users/benjaminzhuang/.fortune_file'

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/benjaminzhuang/.bun/_bun" ] && source "/Users/benjaminzhuang/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerline"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-prompt tmux)

# source ~/alien/alien.zsh
source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

########################################################################

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/benjaminzhuang/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/benjaminzhuang/anaconda3/etc/profile.d/conda.sh" ]; then
      "/Users/benjaminzhuang/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
      export PATH="/Users/benjaminzhuang/anaconda3/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true


# load background
# 249 - Lugia
# 643 - Reshiram
# 717 - Yveltal
# pokemon 249
pokemon 643
# pokemon 717

# login message
#fortune | cowpy -c dragonandcow | lolcat
#echo << ""

source ~/.iterm2_shell_integration.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/benjaminzhuang/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/benjaminzhuang/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/benjaminzhuang/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/benjaminzhuang/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


for config (~/.zsh/*.sh)
  source $config
