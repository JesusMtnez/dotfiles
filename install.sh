############################################
# Author: Jesús Martínez-Barquero Herrrada #
# Last update: 07/09/2015                  #
############################################
#!/usr/bin/env sh

DOT_DIR="$HOME/.dotfiles"
DOT_FILES="gitconfig tmux.conf zshrc Xmodmap emacs.d"

for f in $DOT_FILES; do
    if [ -e $HOME/.$f ]; then
      rm -rf $HOME/.$f;
    fi
    ln -sf $DOT_DIR/$f $HOME/.$f
done

echo "JesusMtnez's dotfiles installed correctly. Enjoy!!"
