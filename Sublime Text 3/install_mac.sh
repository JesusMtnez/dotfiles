###########################################################################
# Author: Jesús Martínez-Barquero Herrada
# Last edited: 05/03/2015
###########################################################################
# Description: Replace Sublime Text 3 Settings and Keymaps with symbolic
#       links to this project files. For MacOSX.
###########################################################################
# URL: https://github.com/JesusMtnez/configs/tree/master/Sublime%20Text%203
###########################################################################
# NOTE: Only works if the script it is called from the same folder where
#       the script is located.
###########################################################################
#
#!/usr/bin/env bash
# Preferences file
ln -sf "$(pwd)/Settings-Keys/Preferences.sublime-settings" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings";
# MacOSX Keymap file
ln -sf "$(pwd)/Settings-Keys/Default (OSX).sublime-keymap" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap";
# XML Preferences
ln -sf "$(pwd)/Settings-Keys/XML.sublime-settings" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/XML.sublime-settings";
# C Preferences
ln -sf "$(pwd)/Settings-Keys/C.sublime-settings" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/C.sublime-settings";
# C++ Preferences
ln -sf "$(pwd)/Settings-Keys/C++.sublime-settings" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/C++.sublime-settings";
###########################################################################
# Plugins
###########################################################################
# Markdown GFM Settings
ln -sf "$(pwd)/Settings-Keys/Markdown.sublime-settings" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Markdown.sublime-settings";
# Plain Tasks Settings
ln -sf "$(pwd)/Settings-Keys/PlainTasks.sublime-settings" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/PlainTasks.sublime-settings";
# MacTerminal Settings
ln -sf "$(pwd)/Settings-Keys/MacTerminal.sublime-settings" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/MacTerminal.sublime-settings";
###########################################################################
# Snippets
###########################################################################
# XML
ln -sf "$(pwd)/Snippets/XML_Snippets" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/XML_Snippets";
# C
ln -sf "$(pwd)/Snippets/C_Snippets" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/C_Snippets";
###########################################################################
# Color Schemes
###########################################################################
# Batman (for XML files)
ln -sf "$(pwd)/ColorSchemes-Themes/Batman.tmTheme" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Batman.tmTheme";
# Cobaltish (for Markdown files)
ln -sf "$(pwd)/ColorSchemes-Themes/MarkdownEditor-Cobaltish.tmTheme" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User/MarkdownEditor-Cobaltish.tmTheme";