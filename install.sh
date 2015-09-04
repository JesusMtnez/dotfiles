############################################
# Author: Jesús Martínez-Barquero Herrrada #
# Last update: 04/09/2015                  #
############################################
#!/usr/bin/env sh

DOT_DIR="$HOME/.dotfiles"
DOT_FILES="gitconfig tmux.conf zshrc Xmodmap"
# DOT_FOLDERS=".emacs.d"

for f in $DOT_FILES; do
    ln -sf $DOT_DIR/$f $HOME/.$f
done

ln -sf $DOT_DIR/.emacs.d $HOME/.emacs.d
