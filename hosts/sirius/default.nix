{ config, lib, pkgs, latestPkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
  bloop-jvm = pkgs.callPackage ../../applications/bloop-jvm.nix { };
in
{

  imports = [
    ../../applications/alacritty.nix
    ../../applications/code
    ../../applications/direnv
    ../../applications/fzf
    ../../applications/git
    ../../applications/neovim.nix
    ../../applications/sbt
    ../../applications/zsh
  ];

  home.sessionVariables = {
    # Support colima+docker for testcontainer: https://java.testcontainers.org/supported_docker_environment/
    TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE = "/var/run/docker.sock";
    DOCKER_HOST = "unix://\${HOME}/.colima/docker.sock";
  };

  fonts.fontconfig.enable = true;

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "TwoDark";
      };
    };
    exa = {
      enable = true;
      enableAliases = true;
      icons = true;
      git = true;
    };
    home-manager.enable = true;
    java.enable = true;
    jq.enable = true;
  };

  home.packages = with pkgs; [
    cachix

    # Global dev tools
    awscli2
    bloop-jvm
    colima
    coursier
    docker-client
    docker-buildx
    docker-compose
    kubectl
    latestPkgs.keepassxc
    latestPkgs.raycast
    latestPkgs.scala-cli
  ];

  home.stateVersion = "23.05";
}
