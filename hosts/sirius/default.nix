{ config, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
in
{
  nixpkgs = {
    config.allowUnfree = true;
    config.packageOverrides = {
      jdk = pkgs.graalvm11-ce;
      jre = pkgs.graalvm11-ce;
    };
  };

  programs.home-manager.enable = true;

  imports = [
    ../../applications/code
    ../../applications/direnv
    ../../applications/fzf
    ../../applications/git
    ../../applications/sbt
    ../../applications/zsh
    ../../scripts
  ];

  fonts.fontconfig.enable = true;

  programs.java.enable = true;

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
