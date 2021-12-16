{ config, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
  jdk = pkgs.graalvm11-ce;
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
    ../../applications/utils
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
    xsel
    httpie

    # Global dev tools
    jdk
    (ammonite_2_13.override { jre = jdk; })
    (coursier.override { jre = jdk; })
    (bloop.override { jre = jdk; })

    # Applications
    keepassxc
    slack
  ];

  home.file = {
    ".xprofile".text = ''
      export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.local/share:/usr/local/share:/usr/share
    '';
  };
}
