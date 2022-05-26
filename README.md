[![MIT LICENSE][LICENSE-badge]][LICENSE-link]
[![Built with nix][NIX-badge]][NIX-link]


  [LICENSE-badge]: https://img.shields.io/badge/license-MIT-green.svg?style=flat-square
  [LICENSE-link]: /LICENSE
  [NIX-badge]: https://img.shields.io/badge/Built_With-Nix-5277C3.svg?logo=nixos&labelColor=73C3D5&style=flat-square
  [NIX-link]: https://builtwithnix.org

# JesusMtnez's dotfiles! #

## Installation ##

> TODO Upgrade installation to use nix flakes only

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

- [`sirius`](./hosts/sirius/README.md): Work machine, based on **OSX**.
- [`albus`](./hosts/albus/README.md): Personal machine, based on **NixOS**.
  ```
    nixos-rebuild switch --use-remote-sudo --flake .
  ```
