<div align="center">

<img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake-colours.svg" width="144px">

# JesusMtnez's dotfiles

_using nix to rule them all_

[![Built with nix][nix-badge]][nix-link]
[![forgejo][forgejo-actions-badge]][forgejo-actions-link]
[![MIT LICENSE][license-badge]][license-link]

</div>

  [forgejo-actions-badge]: https://codeberg.org/JesusMtnez/dotfiles/badges/workflows/ci.yml/badge.svg?&logo=forgejo&style=for-the-badge&logoColor=white&color=blue&label
  [forgejo-actions-link]: https://codeberg.org/JesusMtnez/dotfiles/src/branch/main/.forgejo/workflows/ci.yml
  [nix-badge]: https://img.shields.io/badge/25.11-blue.svg?logo=nixos&style=for-the-badge&logoColor=white&color=blue
  [nix-link]: https://builtwithnix.org
  [license-badge]: https://img.shields.io/badge/license-MIT-green.svg?style=for-the-badge&logoColor=white&color=blue
  [license-link]: /LICENSE

## Machines

|   Name    |                                                                                                                         |                OS                 |  DE   |    Use     |
| :-------: | :---------------------------------------------------------------------------------------------------------------------: | :-------------------------------: | :---: | :--------: |
|  `albus`  |                               <img width="18" src="https://cdn.simpleicons.org/nixos" />                                |            NixOS 25.11            |  KDE  | _Personal_ |
|  `work`   | <img width="18" src="https://cdn.simpleicons.org/kubuntu" /> <img width="18" src="https://cdn.simpleicons.org/nixos" /> |     Kubuntu 25.10 with `nix`      |  KDE  |   _Work_   |
| `minerva` |                               <img width="18" src="https://cdn.simpleicons.org/nixos" />                                | NixOS 25.11 ([See HomeLab][homelab]) |   -   |  _Server_  |

  [homelab]: https://codeberg.org/JesusMtnez/homelab

## Installation

This dotfiles are manage using [`nix`](https://nixos.wiki/wiki/Nix) and [`home-manager`](https://github.com/rycee/home-manager).

### NixOS setup

1. Clone the repository and go inside the folder

```sh
nix run --extra-experimental-features nix-command --extra-experimental-features flakes github:nixos/nixpkgs#git -- clone https://codeberg.com/JesusMtnez/dotfiles $HOME/.dotfiles
```

2. Switch to `$HOSTNAME` flake.

```sh
nixos-rebuild switch --use-remote-sudo --flake $HOME/.dotfiles/.
```

### MacOS setup

Before attempting to use this dotfiles in macOS systems, we need to:

1. Install _Command Line Tools_ (includes `git`)
```sh
xcode-select --install
```

2. Install `homebrew` using its latest [`pkg`][brew-pkg].

```sh
# Setup brew in PATH
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
```

3. Install `nix` using DeterminateSystems [`pkg`][nix-pkg].

  [brew-pkg]: https://github.com/Homebrew/brew/releases
  [nix-pkg]: https://install.determinate.systems/nix-installer-pkg/stable/Universal

4. Setup `nix-darwin` applying the flake for the first time.

```sh
nix run nix-darwin -- switch --flake $HOME/.dotfiles/.
```

5. Switch to `$HOSTNAME` flake.

```sh
# Using nix-darwin, build and switch to your configuration
darwin-rebuild switch --flake $HOME/.dotfiles/.
```

## Notes

#### Restore application menu in KDE

In _System Settings / Startup and Shutdown / Background Services_ disable _Application menus daemon_.

#### gnome-keyring integration in XFCE

In _Settings Manager / Session and Startup / Advanced_ check _Launch GNOME services at startup_.

### NixOS sqlite database corrupted

1. Check integrity: `sqlite3 /nix/var/nix/db/db.sqlite 'pragma integrity_check'`.
2. If the result is not `OK`:

```
# cd /nix/var/nix/db
# nix-shell -p sqlite

[nix-shell:/nix/var/nix/db]# sqlite3 db.sqlite ".backup 'db.bak.sqlite' "

[nix-shell:/nix/var/nix/db]# sqlite3 db.sqlite
sqlite> .output db.sql
sqlite> .dump

[nix-shell:/nix/var/nix/db]# sqlite3 db.new.sqlite < db.sql

[nix-shell:/nix/var/nix/db]# mv db.new.sqlite db.sqlite
```
