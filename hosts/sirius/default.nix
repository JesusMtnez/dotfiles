{ config, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
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
    kubectl
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

    ".sbt/1.0/global.sbt".text = ''
      credentials += Credentials(Path.userHome / ".sbt" / ".credentials")
    '';

    ".sbt/repositories".text = ''
      [repositories]
        local
        ivy-releases: https://artifactory.banno-tools.com/artifactory/ivy-releases/, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]
        libs-release: https://artifactory.banno-tools.com/artifactory/libs-release/
        maven-central
    '';
  };
}
