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
- [`diff-so-fancy`](https://github.com/so-fancy/diff-so-fancy) pager

### zsh ###

Current configuration uses [**Oh My Zsh**](https://github.com/robbyrussell/oh-my-zsh) framework.

Theme: [`powerlevel10k`](https://github.com/romkatv/powerlevel10k)

Plugins:
  - [`autoupdate`](https://github.com/TamCore/autoupdate-oh-my-zsh-plugins)
  - [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)
  - [`zsh-syntac-highlight`](https://github.com/zsh-users/zsh-syntax-highlighting)

### tmux ###

- Tmux Plugin Manager ([tpm](https://github.com/tmux-plugins/tpm))
  - [`tmux-copycat`](https://github.com/tmux-plugins/tmux-copycat)
  - [`tmux-open`](https://github.com/tmux-plugins/tmux-open)
  - [`tmux-prefix-highlight`](https://github.com/tmux-plugins/tmux-prefix-highlight)
  - [`tmux-yank`](https://github.com/tmux-plugins/tmux-yank)
  - [`tmux-onedark-theme`](https://github.com/odedlaz/tmux-onedark-theme)

### i3 Window Manager ###

I use `i3wm` as my window manager. It requires:

  - [`i3-gaps`](https://github.com/Airblader/i3)
  - [`i3status`](https://github.com/i3/i3status)
  - [`i3-gnome`](https://github.com/csxr/i3-gnome): integrate `i3` with `GNOME`, providing flawless integration with `gnome-keyring` or `dbus`.
    - [`arc-gtk-theme`](https://github.com/horst3180/arc-theme/): _Arch Darker_ theme
    - [`papirus-icon-theme`](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme): icon pack
    - [`capitaine-cursors`](https://github.com/keeferrourke/capitaine-cursors): dark cursor theme
  - [`py3status`](https://github.com/ultrabug/py3status) as i3status wrapper.
  - `numlockx` to enable numeric keypad on boot.
  - `ttf-hack`: [Hack font](http://sourcefoundry.org/hack/)
  - `noto-fonts-emoji`: Font to enable emoji support
  - [`flameshot`](https://github.com/lupoDharkael/flameshot) as screenshots tool.
  - [`betterlockscreen`](https://github.com/pavanjadhaw/betterlockscreen) as lockscreen tool.
  - [`rofi`](https://github.com/davatorium/rofi) as application launcher.
  - [`playerctl`](https://github.com/acrisci/playerctl) to control multimedia.
  - [`feh`](https://github.com/derf/feh) as screen wallpaper tool.
  - [`dunst`](https://github.com/dunst-project/dunst) as notification daemon.
  - [`arandr`](https://gitlab.com/arandr/arandr) as `xrandr` gui
  - [`udiskie`](https://github.com/coldfix/udiskie) as automounter for removable media
  - `lightdm-webkit-theme-litarvan`: [Litarvan theme](https://github.com/Litarvan/lightdm-webkit-theme-litarvan)
  - [`tilix`](https://gnunn1.github.io/tilix-web/): as gtk3 terminal emulator
    - [`one-dark`](https://git.io/v7Qaw): color scheme

### ArchLinux ###

- `mirrorupgrade.hook`: pacman hook to update mirror list on `pacman-mirrorlist` upgrade.

### Emacs ###

My Emacs can be found here: [GitLab](https://gitlab.com/JesusMtnez/emacs.d) or
[GitHub Mirror](https://github.com/JesusMtnez/emacs.d)
