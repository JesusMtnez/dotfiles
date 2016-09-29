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
fi

# APT tool alias
alias a='sudo apt'
alias as='sudo apt search'
alias ai='sudo apt install'
alias aup='sudo apt update'
alias aug='sudo apt upgrade'
alias auu='sudo apt update && sudo apt upgrade'
alias ar='sudo apt remove'
alias ap='sudo apt purge'
alias aar='sudo apt autoremove'

# Others
alias RM='rm -rf'
alias grep='grep --color=auto'
alias scala='scala -Dscala.color'
alias mvn='mvn-color'
