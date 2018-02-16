[![MIT LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg)](/LICENSE)

# JesusMtnez's dotfiles! #

## Installation ##

Using git over ssh:

``` shell
git clone --recursive git@gitlab.com:JesusMtnez/dotfiles.git $HOME/.dotfiles
```

> Because `oh-my-zsh` is included as a submodule using `git` over ssh, `git` over https isn't supported right now

## Configurations

### zsh ###

Current configuration uses [**Oh My Zsh**](https://github.com/robbyrussell/oh-my-zsh) framework. It's is included as a git submodule.

Plugins:
  - [`solarized-man`](https://github.com/zlsun/solarized-man)
  - [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)
  - [`zsh-syntac-highlight`](https://github.com/zsh-users/zsh-syntax-highlighting)

### git ###

  - `diff-so-fancy` pager

### tmux ###

- Tmux Plugin Manager ([tpm](https://github.com/tmux-plugins/tpm))
  - [`tmux-copycat`](https://github.com/tmux-plugins/tmux-copycat)
  - [`tmux-open`](https://github.com/tmux-plugins/tmux-open)
  - [`tmux-prefix-highlight`](https://github.com/tmux-plugins/tmux-prefix-highlight)
  - [`tmux-yank`](https://github.com/tmux-plugins/tmux-yank)
  - [`tmux-onedark-theme`](https://github.com/odedlaz/tmux-onedark-theme)

### i3 Window Manager ###

I use `i3wm` as my window manager. It requires:

  - `i3-gaps`
  - `i3status`
  - `py3status` as i3status wrapper.
    - `cower` to fetch pending updates.
  - `ttf-hack-ibx`: [Hack font](http://sourcefoundry.org/hack/)
  - `scrot` as screenshots tool.
  - `i3lock` as lockscreen tool.
  - `rofi` as application launcher.
  - `playerctl`
  - `nitrogen` as screen wallpaper tool.
  - `dunst` as notification daemon.
  - `arandr` as `xrandr` gui
  - `udiskie` as automounter for removable media
  - `lightdm-webkit-theme-litarvan`: [Litarvan theme](https://github.com/Litarvan/lightdm-webkit-theme-litarvan)

### Emacs ###

My Emacs can be found here: [GitLab](https://gitlab.com/JesusMtnez/emacs.d) or
[GitHub Mirror](https://github.com/JesusMtnez/emacs.d)
