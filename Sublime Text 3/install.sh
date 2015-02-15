##########################################################
# Author: Jesús Martínez-Barquero Herrada
# Last edited: 15/02/2015
##########################################################
# Description: Replace Sublime Text 3 Settings and Keymaps
#   with symbolic links to this project files.
##########################################################
# NOTE: Only works if the script it is call from the same
#       folder where the script is locate.
##########################################################
#
#!/bin/bash
# Preferences file
ln -sf "$(pwd)/Settings-Keys/Preferences.sublime-settings" "${HOME}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings"
# Linux Keymap file
ln -sf "$(pwd)/Settings-Keys/Default (Linux).sublime-keymap" "${HOME}/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap"