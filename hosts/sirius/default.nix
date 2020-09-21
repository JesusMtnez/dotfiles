{ config, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";

  dotfiles = homedir + "/.dotfiles";
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
    ".Xkbmap".source = dotfiles + "/Xkbmap";
    ".xprofile".source = dotfiles + "/xprofile";
    ".zshrc".source = dotfiles + "/zshrc";
  };
}
