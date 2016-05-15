# TERM
export TERM='xterm-256color'

# Bin
export PATH="/usr/bin:/usr/sbin:/sbin:/bin":$PATH
# Local bin
export PATH="/usr/local:/usr/local/bin:/usr/local/sbin":$PATH
# My personal bin path
export PATH="$HOME/.dotfiles/bin":$PATH

# Set zsh functions path
export fpath=(/usr/local/share/zsh-completions /usr/local/etc/bash_completion.d/ $fpath)

# EDITOR
export EDITOR="emacs -nw"
export VISUAL=emacs
