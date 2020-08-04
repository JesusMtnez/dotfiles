{ config, pkgs, ... }:

{
  programs.home-manager = {
    enable = true;
    # path = https://github.com/rycee/home-manager/archive/release-18.09.tar.gz;
  };

  home.stateVersion = "20.03";

  home.packages = [
    pkgs.direnv
    pkgs.lorri
  ];

  services.lorri.enable = true;

  # TODO Timer not working
  services.random-background = {
    enable = true;
    display = "fill";
    imageDirectory = "%h/Pictures/wallpapers";
    interval = "30sec";
    enableXinerama = false;
  };

  home.file = {

    ".gitignore".source = ./gitignore;
    ".gitconfig".source = ./gitconfig;
    ".tmux.conf".source = ./tmux.conf;
    ".Xkbmap".source = ./Xkbmap;
    ".zshrc".source = ./zshrc;

    ".i3" = {
      source = ./i3;
      recursive = true;
    };

    ".config/systemd/user" = {
      source = ./config/systemd/user;
      recursive = true;
    };

    ".config/dunst" = {
      source = ./config/dunst;
      recursive = true;
    };

    ".config/rofi" = {
      source = ./config/rofi;
      recursive = true;
    };

    ".config/tilix" = {
      source = ./config/tilix;
      recursive = true;
    };

    ".sbt/1.0/plugins" = {
      source = ./sbt/plugins;
      recursive = true;
    };

    ".local/share/applications" = {
      source = ./applications;
      recursive = true;
    };
  };
}
