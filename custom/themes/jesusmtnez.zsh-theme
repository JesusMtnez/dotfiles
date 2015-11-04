# jesusmtnez.oh-my-zsh
# screenshot: URL
# Based on: ys, soring and murilasso

local return_status="%(?..%{$fg[red]%}%? ⏎%{$reset_color%})"
local user_host='%{$fg[cyan]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[cyan]%}%~%{$reset_color%}'
local git_info='$(git_prompt_info)'
local git_status='$(git_prompt_status)'

PROMPT="\
${user_host}: \
${current_dir}
${git_info}\
 ${git_status}\
%{$fg_bold[green]%}❯%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git%{$reset_color%}:%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔%{$reset_color%}"

RPROMPT='${return_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}✹ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}✭ "
