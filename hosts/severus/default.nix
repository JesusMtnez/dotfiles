{ pkgs, latestPkgs, ... }:

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
    ../../applications/neovim.nix
    ../../applications/zsh
    ../../scripts
  ];

  fonts.fontconfig.enable = true;

  programs = {
    bat.enable = true;
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
    latestPkgs.joplin-desktop
    latestPkgs.keepassxc
    latestPkgs.raycast
    latestPkgs.scala-cli
  ];

  home.stateVersion = "23.05";
}
