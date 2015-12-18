#!/usr/bin/env sh
# Author: JesusMtnez

# Installing oh-my-zsh
read -p "Install oh-my-zsh? [Y/n]: " -n 1 -r
[ -z $REPLY ] && REPLY='Y' || echo # Default [Y]

[[ $REPLY =~ ^[Yy]$ ]] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo;

echo "oh-my-zsh installed correctly."
