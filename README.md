<div align="center">

<img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg" width="144px">

# JesusMtnez's dotfiles

_using nix to rule them all_

[![Built with nix][NIX-badge]][NIX-link]
[![woodpecker-status][STATUS-badge]][STATUS-link]
[![MIT LICENSE][LICENSE-badge]][LICENSE-link]

</div>

  [STATUS-badge]: https://ci.codeberg.org/api/badges/13009/status.svg
  [STATUS-link]: https://ci.codeberg.org/repos/13009
  [NIX-badge]: https://img.shields.io/badge/nix-blue.svg?logo=nixos&labelColor=73C3D5
  [NIX-link]: https://builtwithnix.org
  [LICENSE-badge]: https://img.shields.io/badge/license-MIT-green.svg
  [LICENSE-link]: /LICENSE

## Machines

| Name |      | OS  | DE  | WM  | Use |
| :-:  | :-:  | :-: | :-: | :-: | :-: |
| `albus` | <img width="18" src="https://cdn.simpleicons.org/nixos" /> | NixOS 23.11 | Gnome |  - | _Personal_ |
| `ron` | <img width="18" src="https://cdn.simpleicons.org/apple" /> | macOS 14.1 | - | - | _Personal_ |

## Installation

This dotfiles are manage using [`nix`](https://nixos.wiki/wiki/Nix) and [`home-manager`](https://github.com/rycee/home-manager).

### NixOS setup

1. Clone the repository and go inside the folder

```sh
nix run --extra-experimental-features nix-command --extra-experimental-features flakes github:nixos/nixpkgs#git -- clone git@github.com:JesusMtnez/dotfiles $HOME/.dotfiles
```

2. Switch to `$HOSTNAME` flake.

```sh
nixos-rebuild switch --use-remote-sudo --flakes $HOME/.dotfiles/.
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
