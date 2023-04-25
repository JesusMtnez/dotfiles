{ config, lib, pkgs, latestPkgs, ... }:

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
    ../../applications/todotxt.nix
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
    awscli2
    colima
    coursier
    docker-client
    docker-buildx
    docker-compose
    kubectl
    latestPkgs.scala-cli
  ];

  home.stateVersion = "22.11";
}
