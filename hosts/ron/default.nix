{ config, lib, pkgs, latestPkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
in
{

  imports = [
    ../../applications/alacritty.nix
    ../../applications/code.nix
    ../../applications/direnv.nix
    ../../applications/git.nix
    ../../applications/neovim.nix
    ../../applications/zsh
  ];

  home.sessionVariables = {
    # Support colima+docker for testcontainer: https://java.testcontainers.org/supported_docker_environment/
    TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE = "/var/run/docker.sock";
    DOCKER_HOST = "unix://\${HOME}/.colima/docker.sock";
  };

  fonts.fontconfig.enable = true;

  programs = {
    home-manager.enable = true;
    java.enable = true;
    jq.enable = true;
  };

  home.packages = with pkgs; [
    cachix

    # Global dev tools
    colima
    docker-client
    docker-buildx
    docker-compose
    latestPkgs.joplin
    latestPkgs.keepassxc
    latestPkgs.raycast
  ];

  home.stateVersion = "23.05";
}
