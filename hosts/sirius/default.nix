{ config, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
  jdk = pkgs.jdk11;
  emacsOverlay = import (import ../../nix/sources.nix)."emacs-overlay";
in
{
  nixpkgs = {
    config.allowUnfree = true;
    config.packageOverrides = {
      jdk = pkgs.jdk11;
      jre = pkgs.jdk11;
    };
    overlays = [ emacsOverlay ];
  };

  programs.home-manager.enable = true;

  imports = [
    ../../applications/code
    ../../applications/direnv
    ../../applications/emacs
    ../../applications/fzf
    ../../applications/git
    ../../applications/sbt
    ../../applications/zsh
  ];

  fonts.fontconfig.enable = true;

  programs.java = {
    enable = true;
    package = jdk;
  };

  home.packages = with pkgs; [
    cachix

    # Fonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    fira-code-symbols

    # Cli tools
    bat
    jq
    # xsel
    httpie

    # Global dev tools
    ammonite_2_13
    coursier
    # (bloop.override { jre = jdk; })
    kubectl
    awscli2

    # Applications
    # keepassxc - incompatible
    # slack - https://github.com/NixOS/nixpkgs/issues/123440
  ];
}
