{ config, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";

  sources = import ../../nix/sources.nix;
  nixpkgs = sources."nixpkgs";
  stablepkgs = import nixpkgs {};
in
{
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  imports = [
    ../../applications/ammonite
    ../../applications/codium
    ../../applications/coursier
    ../../applications/direnv
    ../../applications/emacs
    ../../applications/fzf
    ../../applications/git
    ../../applications/neovim
    ../../applications/sbt
    ../../applications/utils
    ../../applications/zsh
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })

    # Cli tools
    bat
    stablepkgs.kubectl
    jq
    xsel
    httpie

    # Global dev tools
    graalvm11-ce
    (pkgs.bloop.override { jre = pkgs.graalvm11-ce; })

    # Graphics
    keepassxc
    slack
  ];

  home.file = {
    ".xprofile".text = ''
      export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.local/share:/usr/local/share:/usr/share
    '';
  };
}
