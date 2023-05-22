{ pkgs, latestPkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
in
{
  programs.home-manager.enable = true;

  imports = [
    ../../applications/alacritty.nix
    ../../applications/code
    ../../applications/direnv
    ../../applications/fzf
    ../../applications/git
    ../../applications/zsh
    ../../scripts
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    bat
    cachix
    jq
  ];

  home.stateVersion = "22.11";
}
