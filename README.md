# JesusMtnez's dotfiles! #

## Installation ##

Using git over ssh:

``` shell
git clone --recursive git@gitlab.com:JesusMtnez/dotfiles.git $HOME/.dotfiles
```

:warning: Because `oh-my-zsh` is included as a submodule using `git` over ssh, `git` over https isn`t supported right now :warning:

## Configurations

### zsh ###

Current configuration uses [**Oh My Zsh**](https://github.com/robbyrussell/oh-my-zsh) framework. It's is included as a git submodule.

Plugins:
 - `zsh-syntac-highlight`

### git ###

 - `diff-so-fancy` pager

### tmux ###

> TODO

### i3 Window Manager ###

I use `i3wm` as my window manager. It requires:

 - `i3-gaps`
 - `py3status` as i3status bar.
 - `scrot` as screenshots tool.
 - `i3lock` as lockscreen tool.
 - `rofi` as application launcher.
 - `playerctl`
 - `nitrogen` as screen wallpaper tool.
 - `dunst` as notification daemon.
 - `udiskie` as automounter for removable media

### Emacs ###

My Emacs can be found here: [GitLab](https://gitlab.com/JesusMtnez/emacs.d) or
[GitHub Mirror](https://github.com/JesusMtnez/emacs.d)
