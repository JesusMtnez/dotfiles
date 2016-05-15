# Author: JesusMtnez

###########################
# oh-my-zsh configuration #
###########################
export ZSH=$HOME/.dotfiles/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.dotfiles/custom
ZSH_THEME="jesusmtnez"
export TERM='xterm-256color'
export UPDATE_ZSH_DAYS=3
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy/mm/dd"
plugins=(brew docker docker-compose git-extras heroku npm mvn zsh-syntax-highlighting)

######################
# User configuration #
######################
# PATH
export PATH="/usr/games:/usr/local/games":$PATH
export PATH="/usr/bin:/usr/sbin:/sbin:/bin":$PATH
export PATH="/usr/local:/usr/local/bin:/usr/local/sbin":$PATH
export PATH="$HOME/bin":$PATH # My personal bin path

# Functions Path
export fpath=(/usr/local/share/zsh-completions /usr/local/etc/bash_completion.d/ $fpath)

# Libraries Path
export LIBRARY_PATH="/usr/local/lib":$LD_LIBRARY_PATH
export C_INCLUDE_PATH="/usr/local/include"
export CPLUS_INCLUDE_PATH="/usr/local/include"

# export MANPATH="/usr/local/man:$MANPATH"
export EDITOR="emacs -nw"
export VISUAL=emacs
export NVM_DIR="$HOME/.nvm"

# Source OH-MY-ZSH
source $ZSH/oh-my-zsh.sh

# Source local configuration
[ -f $HOME/.localrc ] && source $HOME/.localrc

# Source aliases
[ -f $HOME/.alias ] && source $HOME/.alias

# Source fzf bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

#############
# Functions #
#############

# Create dir and move inside.
mcd() {
    mkdir "$1" && cd "$1"
}

# Act as git status if no parameters.
g() {
    if [[ $# > 0 ]]; then
      git $@
    else
        git status -sb
    fi
}
# Auto-complete g function as git
compdef g=git

# Auto-complete t alias as tmux
compdef t=tmux

# History configuration
setopt hist_ignore_all_dups
setopt hist_ignore_space

#########
# Hooks #
#########

# Change PWD hook
function chpwd() {
    ls -lh
}

# Avoid duplicated in PATH
export -U PATH
