{ pkgs, latestPkgs, ... }:

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

  fonts.fontconfig.enable = true;

  programs = {
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

  home.stateVersion = "23.11";
}
