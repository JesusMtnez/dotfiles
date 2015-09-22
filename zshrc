# Author: JesusMtnez

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/.oh-my-zsh
# Set name of the theme to load.
ZSH_THEME="sorin"
export TERM='xterm-256color'
export UPDATE_ZSH_DAYS=3
# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(brew docker docker-compose git-extras heroku npm mvn zsh-syntax-highlighting)

######################
# User configuration #
######################
export PATH="$HOME/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:/usr/games:/usr/local/games":$PATH
fpath=(/usr/local/share/zsh-completions /usr/local/etc/bash_completion.d/ $fpath)
export LIBRARY_PATH="/usr/local/lib":$LD_LIBRARY_PATH
export C_INCLUDE_PATH="/usr/local/include"
export CPLUS_INCLUDE_PATH="/usr/local/include"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Source local configuration
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# Change PWD hook
function chpwd() {
    ls -lh
}

#########
# ALIAS #
#########

# Source aliases
if [ -f $HOME/.alias ]; then
  source ~HOME/.alias
fi

#############
# FUNCTIONS #
#############

# Create dir and move inside.
function mcd() {
    mkdir "$1" && cd "$1"
}

# Act as git status if no parameters.
function g() {
    if [[ $# > 0 ]]; then
      git $@
    else
        git status -sb
    fi
}
# Auto-complete g function as git
compdef g=git

########
# TMUX # (DISABLED)
########
# [[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
