{ config, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
  jdk = pkgs.openjdk11;
  emacsOverlay = import (import ../../nix/sources.nix)."emacs-overlay";
in
{
  nixpkgs = {
    config.allowUnfree = true;
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
    jdk
    (ammonite_2_13.override { jre = jdk; })
    (coursier.override { jre = jdk; })
    # (bloop.override { jre = jdk; })
    kubectl
    awscli

    # Applications
    # keepassxc - incompatible
    # slack - https://github.com/NixOS/nixpkgs/issues/123440
  ];
}
