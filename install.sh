############################################
# Author: Jesús Martínez-Barquero Herrrada #
# Last update: 12/05/2015                  #
############################################

DOT="${HOME}/.dotfiles"

ln -sf $DOT/.emacs.d ${HOME}
ln -sf $DOT/.gitconfig ${HOME}/.gitconfig
ln -sf $DOT/.zshrc ${HOME}/.zshrc
ln -sf $DOT/.tmux.conf ${HOME}/.tmux.conf
ln -sf $DOT/ohmytheme.zsh-theme ${HOME}/.oh-my-zsh/themes/ohmytheme.zsh-theme
