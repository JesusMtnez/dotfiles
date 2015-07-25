###########################################
# Author: Jesús Martínez-Barquero Herrada #
# Last updated: 25-07-2015                #
###########################################
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
plugins=(zsh-syntax-highlighting git-extras django npm)
#
######################
# User configuration #
######################
export PATH="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:/usr/games:/usr/local/games":$PATH
fpath=(/usr/local/share/zsh-completions /usr/local/etc/bash_completion.d/ $fpath)
export LIBRARY_PATH="/usr/local/lib":$LD_LIBRARY_PATH
export C_INCLUDE_PATH="/usr/local/include"
export CPLUS_INCLUDE_PATH="/usr/local/include"
# export MANPATH="/usr/local/man:$MANPATH"
#
########
# TMUX # (DISABLED)
########
# [[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux
#
source $ZSH/oh-my-zsh.sh
#
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
#########
# ALIAS #
#########
#
alias zshconfig='emacs -nw ~/.zshrc'
alias e='emacs -nw'
