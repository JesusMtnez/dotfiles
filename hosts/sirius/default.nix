{ config, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
in
{
  nixpkgs.config.allowUnfree = true;

  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/master.tar.gz;
  };

  imports = [
    ../../applications/codium
    ../../applications/direnv
    ../../applications/dunst
    ../../applications/emacs
    ../../applications/fzf
    ../../applications/git
    ../../applications/i3
    ../../applications/neovim
    ../../applications/rofi
    ../../applications/sbt
    ../../applications/tilix
    ../../applications/tmux
    ../../applications/utils
    ../../applications/zsh

    # TODO Service is not started: https://github.com/rycee/home-manager#graphical-services
    ../../services/random-background
  ];

  home.packages = with pkgs; [
    bat
    kubectl
    jq
    glibcLocales # Fix rofi in arch-linux

    # TODO zsh / zplug integration https://github.com/rycee/home-manager/blob/1b210e7143547ce0f41e8082b8d27e9c7d220351/modules/programs/zplug.nix

    keepassxc
    slack
  ];

  # TODO Generate dunst service using nix, to link to the proper dunst link
  xdg.configFile."systemd/user/dunst.service".source = ./dunst.service;

  home.file = {
    ".Xkbmap".text = "-layout us -variant altgr-intl -option ctrl:nocaps";
    ".xprofile".text = ''
      export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.local/share:/usr/local/share:/usr/share

      # Fix in Arch: https://github.com/NixOS/nix/issues/599#issuecomment-147200966
      #              https://github.com/NixOS/nixpkgs/issues/6878
      if type nix-env > /dev/null; then
        export LOCALE_ARCHIVE=`nix-env --installed --no-name --out-path --query glibc-locales`/lib/locale/locale-archive
      fi
    '';
  };
}
