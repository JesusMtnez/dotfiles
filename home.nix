{ config, pkgs, ... }:

{
  programs.home-manager = {
    enable = true;
    # path = https://github.com/rycee/home-manager/archive/release-18.09.tar.gz;
  };

  home.packages = with pkgs; [
    feh
    direnv
    lorri
    bat
    git
    gitAndTools.diff-so-fancy
    numlockx
    tmux
    # TODO Handle tpm / plugins installation
    # TODO Rofi fails to start: rofi glibLocales
    # TODO zsh / zplug integration https://github.com/rycee/home-manager/blob/1b210e7143547ce0f41e8082b8d27e9c7d220351/modules/programs/zplug.nix
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
    ".xprofile".source = ./xprofile;
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
