{ config, lib, pkgs, latestPkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
in
{

  imports = [
    ../../applications/alacritty.nix
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

  programs = {
    bat.enable = true;
    home-manager.enable = true;
    java.enable = true;
    jq.enable = true;
  };

  home.packages = with pkgs; [
    cachix

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
