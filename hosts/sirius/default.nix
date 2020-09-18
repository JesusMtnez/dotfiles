{ config, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
  dotfiles = homedir + "/.dotfiles";
in
{
  nixpkgs.config.allowUnfree = true;

  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/master.tar.gz;
  };

  imports = [
    ../../applications/codium
    ../../applications/direnv
    ../../applications/emacs
    ../../applications/fzf
    ../../applications/git
    ../../applications/sbt
    ../../applications/utils
  ];

  home.packages = with pkgs; [
    bat
    kubectl
    numlockx
    tmux
    jq
    glibcLocales
    rofi

    # TODO Handle tpm / plugins installation
    # TODO zsh / zplug integration https://github.com/rycee/home-manager/blob/1b210e7143547ce0f41e8082b8d27e9c7d220351/modules/programs/zplug.nix

    keepassxc
    slack
  ];

  # TODO Service is not started: https://github.com/rycee/home-manager#graphical-services
  services.random-background = {
    enable = true;
    display = "fill";
    imageDirectory = "%h/Pictures/wallpapers";
    interval = "30sec";
    enableXinerama = false;
  };


  xdg.configFile."systemd/user" = {
    source = dotfiles + "/config/systemd/user";
    recursive = true;
  };

  xdg.configFile."dunst" = {
    source = dotfiles + "/config/dunst";
    recursive = true;
  };

  xdg.configFile."rofi" = {
    source = dotfiles + "/config/rofi";
    recursive = true;
  };

  xdg.configFile."tilix" = {
    source = dotfiles + "/config/tilix";
    recursive = true;
  };

  xdg.configFile."i3" = {
    source = dotfiles + "/config/i3";
    recursive = true;
  };

  home.file = {
    ".tmux.conf".source = dotfiles + "/tmux.conf";
    ".Xkbmap".source = dotfiles + "/Xkbmap";
    ".xprofile".source = dotfiles + "/xprofile";
    ".zshrc".source = dotfiles + "/zshrc";

    ".local/share/applications" = {
      source = dotfiles + "/applications";
      recursive = true;
    };
  };
}
