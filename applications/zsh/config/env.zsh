# TERM
export TERM='xterm-256color'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Bin
# export PATH="/usr/bin:/usr/sbin:/sbin:/bin":$PATH
# Local bin
# export PATH="/usr/local:/usr/local/bin:/usr/local/sbin":$PATH
# Machine local bin
export PATH="$HOME/.local/bin":$PATH
# My personal bin path
export PATH="$HOME/.dotfiles/bin":$PATH

# Set zsh functions path
export fpath=(/usr/local/share/zsh-completions /usr/local/etc/bash_completion.d/ $fpath)

# EDITOR
export EDITOR="emacs -nw"
export VISUAL=emacs

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
