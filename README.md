[![MIT LICENSE][LICENSE-badge]][LICENSE-link]
[![Built with nix][NIX-badge]][NIX-link]


  [LICENSE-badge]: https://img.shields.io/badge/license-MIT-green.svg?style=flat-square
  [LICENSE-link]: /LICENSE
  [NIX-badge]: https://img.shields.io/badge/Built_With-Nix-5277C3.svg?logo=nixos&labelColor=73C3D5&style=flat-square
  [NIX-link]: https://builtwithnix.org

# JesusMtnez's dotfiles! #

## Installation ##

This dotfiles are manage using [`nix`](https://nixos.wiki/wiki/Nix) and [`home-manager`](https://github.com/rycee/home-manager). The steps to do a complete setup are:

1. Clone the repository and go inside the folder

```
nix-shell -p git --run "git clone git@github.com:JesusMtnez/dotfiles $HOME/.dotfiles"
```

2. Link `home.nix`:

```
mkdir -p $HOME/.config/nixpkgs
ln -sf $HOME/.dotfiles/hosts/$HOSTNAME/default.nix ~/.config/nixpkgs/home.nix
```
3. Execute: `$HOME/.dotfiles/switch`.

## Machines

### Active

- [`sirius`](./hosts/sirius/README.md): Work machine, based on **OSX**.
- [`albus`](./hosts/albus/README.md): Personal machine, based on **NixOS**.
  ```
    nixos-rebuild switch --use-remote-sudo --flake .
  ```

### Decommissioned

- [`sirius-pop`](./hosts/sirius-pop/README.md): Old work machine, based on [Pop_OS](https://pop.system76.com/)
- [`sirius-arch`](./hosts/sirius-arch): Old `sirius` configuration, based on [Arco Linux](https://arcolinux.com/).

## Common tools

> TODO Review section, may have out-dated information.

### CLI tools

- [`bat`](https://github.com/sharkdp/bat) as `cat` with syntax highlight and git support.
- [`diff-so-fancy`](https://github.com/so-fancy/diff-so-fancy) pager

### zsh ###

Current configuration uses [**zplug**](https://github.com/zplug/zplug) framework.

Theme: [`powerlevel10k`](https://github.com/romkatv/powerlevel10k)

Plugins:
  - [`enhancd`](https://github.com/b4b4r07/enhancd)
  - [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)
  - [`zsh-completions`](https://github.com/zsh-users/zsh-completions)
  - [`fast-syntax-highlighting`](https://github.com/zdharma/fast-syntax-highlighting)
  - [`zsh-autopair`](https://github.com/hlissner/zsh-autopair)

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
  - `nerd-font-fira-code`: [FuraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)
  - `otf-fira-code-symbol`: [Fira Code Symbol Font](https://github.com/tonsky/FiraCode/files/412440/FiraCode-Regular-Symbol.zip)
  - `noto-fonts-emoji`: Font to enable emoji support
  - [`flameshot`](https://github.com/lupoDharkael/flameshot) as screenshots tool.
  - [`peek`](https://github.com/phw/peek) as screen recording tool.
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

### Emacs ###

My Emacs can be found here: [GitLab](https://gitlab.com/JesusMtnez/emacs.d) or
[GitHub Mirror](https://github.com/JesusMtnez/emacs.d)
