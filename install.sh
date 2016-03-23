#!/usr/bin/env sh
# Author: JesusMtnez

DOT_DIR="$HOME/.dotfiles"
DOT_FILES="gitconfig gitignore tmux.conf zshrc Xmodmap alias spacemacs.d"

for f in $DOT_FILES; do
    if [ -e $HOME/.$f ]; then
      rm -rf $HOME/.$f;
    fi
    ln -sf $DOT_DIR/$f $HOME/.$f
done

# Create $HOME/bin if necessary
if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

# Install my scripts
for b in bin/*; do
    chmod +x $DOT_DIR/$b
    ln -sf $DOT_DIR/$b $HOME/$b
done

echo "JesusMtnez's dotfiles installed correctly. Enjoy!!"
