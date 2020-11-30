# Rerun as sudo
alias please='sudo -E $(fc -ln -1)'
alias fuck='sudo -E $(fc -ln -1)'

# ls alias
if [ `uname` = 'Darwin' ]; then
  alias ls='ls -G'  # Colorized in MacOSX
else
  alias ls='ls --color=auto'
fi
alias la='ls -A'    # show almost all
alias l='ls -lFh'   # long list, show type, human readable
alias ll='ls -lAFh' # long list, show almost all, show type, human readeable

# Emacs
alias e='emacs -nw'
alias emacs='emacs -nw'

# Copy/Paste as MacOSX in Linux
if [ `uname` = 'Linux' ]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
  alias open='xdg-open'
fi

# Others
alias RM='rm -rf'
alias grep='grep --color=auto'

alias vbox='VBoxManage'
compdef vbox=VBoxManage
