#!/usr/bin/env sh
# Author: JesusMtnez

DOT_DIR="$HOME/.dotfiles"
DOT_FILES="gitconfig gitignore tmux.conf zshrc Xmodmap Xresources dunstrc emacs.d i3"

for f in $DOT_FILES; do
  if [ -e $HOME/.$f ]; then
    rm -rf $HOME/.$f;
  fi
  ln -sf $DOT_DIR/$f $HOME/.$f
done

echo "JesusMtnez's dotfiles installed correctly. Enjoy!!"
