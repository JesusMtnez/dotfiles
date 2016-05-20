# Create dir and move inside.
mk() {
  mkdir -p "$1" && cd "$1"
}

# Act as git status if no parameters.
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status -sb
  fi
}
compdef g=git
