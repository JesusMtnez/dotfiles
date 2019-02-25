[![MIT LICENSE][LICENSE-badge]][LICENSE-link]

  [LICENSE-badge]: https://img.shields.io/badge/license-MIT-green.svg?style=flat-square
  [LICENSE-link]: /LICENSE

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [JesusMtnez's dotfiles!](#jesusmtnezs-dotfiles)
    - [Installation](#installation)
        - [SSH](#ssh)
        - [HTTPS](#https)
    - [Configurations](#configurations)
        - [CLI tools](#cli-tools)
        - [zsh](#zsh)
        - [git](#git)
        - [tmux](#tmux)
        - [i3 Window Manager](#i3-window-manager)
        - [ArchLinux](#archlinux)
        - [Emacs](#emacs)

<!-- markdown-toc end -->

# JesusMtnez's dotfiles! #

## Installation ##

This dotfiles are manage using `git` and [`dotbot`](https://github.com/anishathalye/dotbot/). The steps to do a complete setup are:

1. Clone the repository.
2. Execute `<clone-dir>/install`.


### SSH ###

``` shell
> git clone git@gitlab.com:JesusMtnez/dotfiles.git $HOME/.dotfiles
> $HOME/.dotfiles/install
```


### HTTPS ###

``` shell
> git clone https://gitlab.com/JesusMtnez/dotfiles.git $HOME/.dotfiles
> $HOME/.dotfiles/install
```

## Configurations

### CLI tools

- [`bat`](https://github.com/sharkdp/bat) as `cat` with syntax highlight and git support.

### zsh ###

Current configuration uses [**Oh My Zsh**](https://github.com/robbyrussell/oh-my-zsh) framework.

Theme: [`powerlevel9k`](https://github.com/bhilburn/powerlevel9k)

Plugins:
  - [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)
  - [`zsh-syntac-highlight`](https://github.com/zsh-users/zsh-syntax-highlighting)

### git ###

  - [`diff-so-fancy`](https://github.com/so-fancy/diff-so-fancy) pager

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
  - [`i3-gnome`](https://github.com/csxr/i3-gnome): integrate `i3` with `GNOME`, providing flawless integration with `gnome-keyring` or `dbus`.
  - `py3status` as i3status wrapper.
  - `numlockx` to enable numeric keypad on boot.
  - `ttf-hack`: [Hack font](http://sourcefoundry.org/hack/)
  - [`flameshot`](https://github.com/lupoDharkael/flameshot) as screenshots tool.
  - [`i3lock-color`](https://github.com/PandorasFox/i3lock-color) as lockscreen tool.
  - `rofi` as application launcher.
  - `playerctl` to control multimedia.
  - ``feh` as screen wallpaper tool.
  - `dunst` as notification daemon.
  - `arandr` as `xrandr` gui
  - `udiskie` as automounter for removable media
  - `lightdm-webkit-theme-litarvan`: [Litarvan theme](https://github.com/Litarvan/lightdm-webkit-theme-litarvan)
  - [`tilix`](https://gnunn1.github.io/tilix-web/): as gtk3 terminal emulator
    - [`nord-tilix`](https://git.io/nord-tilix): color scheme

### ArchLinux ###

- `mirrorupgrade.hook`: pacman hook to update mirror list on `pacman-mirrorlist` upgrade.

### Emacs ###

My Emacs can be found here: [GitLab](https://gitlab.com/JesusMtnez/emacs.d) or
[GitHub Mirror](https://github.com/JesusMtnez/emacs.d)
