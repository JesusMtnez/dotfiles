# Author: JesusMtnez

export ZSH=$HOME/.dotfiles/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.dotfiles/zsh
export UPDATE_ZSH_DAYS=3

ZSH_THEME="jesusmtnez"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy/mm/dd"

plugins=(brew docker docker-compose git-extras heroku npm mvn zsh-syntax-highlighting)

# These sources are unnecessary since oh-my-zsh framework will load all *.zsh in ZSH_CUSTOM
# source $ZSH_CUSTOM/alias.zsh
# source $ZSH_CUSTOM/env.zsh
# source $ZSH_CUSTOM/functions.zsh
# source $ZSH_CUSTOM/hooks.sh

# Launch oh-my-zsh framework
source $ZSH/oh-my-zsh.sh

# Source other resource
[ -f $HOME/.localrc ] && source $HOME/.localrc # Local configuration
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh # fzf bindings

# History configuration
setopt hist_ignore_all_dups
setopt hist_ignore_space
unsetopt nomatch

# Avoid duplicated in PATH
export -U PATH
