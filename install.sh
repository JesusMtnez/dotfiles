############################################
# Author: Jesús Martínez-Barquero Herrrada #
# Last update: 04/09/2015                  #
############################################
#!/usr/bin/env sh

DOT_DIR="$HOME/.dotfiles"
DOT_FILES="gitconfig tmux.conf zshrc Xmodmap"
DOT_DIRS="emacs.d"

###########################
# Delete old config files #
###########################
for f in $DOT_FILES; do
    if [ -f $HOME/.$f ]; then
      rm $HOME/.$f;
    fi
done

for d in $DOT_DIRS; do
    if [ -d $HOME/.$d ]; then
      rm -rf $HOME/.$d;
    fi
done

####################
# Install dotfiles #
####################
# Install files
for f in $DOT_FILES; do
    ln -sf $DOT_DIR/$f $HOME/.$f
done
# Install dirs
for d in $DOT_DIRS; do
    ln -sf $DOT_DIR/$d $HOME/.$d
done

echo "JesusMtnez's dotfiles installed correctly. Enjoy!!"
