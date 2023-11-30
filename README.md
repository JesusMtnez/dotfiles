<div align="center">

<img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg" width="144px">

# JesusMtnez's dotfiles

_using nix to rule them all_

[![Built with nix][NIX-badge]][NIX-link]
[![MIT LICENSE][LICENSE-badge]][LICENSE-link]

</div>

  [NIX-badge]: https://img.shields.io/badge/nix-blue.svg?logo=nixos&labelColor=73C3D5&style=for-the-badge
  [NIX-link]: https://builtwithnix.org
  [LICENSE-badge]: https://img.shields.io/badge/license-MIT-green.svg?style=for-the-badge
  [LICENSE-link]: /LICENSE

## Installation ##

This dotfiles are manage using [`nix`](https://nixos.wiki/wiki/Nix) and [`home-manager`](https://github.com/rycee/home-manager). The steps to do a complete setup are:

1. Clone the repository and go inside the folder

```
nix run --extra-experimental-features nix-command --extra-experimental-features flakes github:nixos/nixpkgs#git -- clone git@github.com:JesusMtnez/dotfiles $HOME/.dotfiles
```

2. Build and switch the host machine.

If it is a NixOS host:

```
nixos-rebuild switch --use-remote-sudo --flakes $HOME/.dotfiles/.
```

If it is a MacOSX host:

```
# Use bootstrap flake to setup nix-darwin in you system first
nix build .#darwinConfigurations.bootstrap.system --extra-experimental-features nix-command --extra-experimental-features flakes
./result/sw/bin/darwin-rebuild switch --flake $HOME/.dotfiles/.#bootstrap

# Using nix-darwin, build and switch to your configuration
darwin-rebuild switch --flake  $HOME/.dotfiles/.
```

## Machines

- [`albus`](./hosts/albus/README.md): Personal machine, based on **NixOS**.

```
nixos-rebuild switch --use-remote-sudo --flake .#albus
```

- [`severus`](./hosts/severus/README.md): Personal machine, based on **OSX**

```
darwin-rebuild switch --flake .#severus
```

## Notes

#### gnome-keyring integration in XFCE

In _Settings Manager / Session and Startup / Advanced_ check _Launch GNOME services at startup_

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
