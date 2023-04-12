{ config, lib, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
in
{
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

    # Cli tools
    bat
    jq

    # Global dev tools
    ammonite_2_13
    awscli2
    colima
    coursier
    docker-client
    docker-buildx
    docker-compose
    kubectl
  ];

  home.stateVersion = "22.11";
}
