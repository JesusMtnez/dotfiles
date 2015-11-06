#!/usr/bin/env sh
# Source: https://github.com/tmtxt/dotfiles/blob/master/removeDSfiles.sh

# Clean all '.DS_store' files in $HOME
sudo find ~ -name ".DS_Store" -depth -exec rm {} \;
echo "All '.DS_store' files clean!"
