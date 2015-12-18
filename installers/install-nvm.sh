#!/usr/bin/env sh
# Author: JesusMtnez

# Install nvm
read -p "Install nvm? [Y/n]: " -n 1 -rg
[ -z $REPLY ] && REPLY="Y" || echo # Default [Y]

[[ $REPLY =~ ^[Yy]$ ]] && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
echo;

echo "nvm installed correctly."
