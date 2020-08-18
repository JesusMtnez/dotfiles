{ config, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
in
{
  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/master.tar.gz;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "editor.fontFamily" = "'FuraCode Nerd Font'";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 12;
      "editor.fontWeight" = "normal";
      "editor.renderWhitespace" = "all";
      "editor.tabSize" = 2;
      "editor.wordWrapColumn" = 100;
      "explorer.confirmDelete" = false;
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 500;
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "oneDarkPro.vivid" = true;
      "terminal.integrated.cursorStyle" = "line";
      "terminal.integrated.fontFamily" = "'FuraCode Nerd Font'";
      "terminal.integrated.fontSize" = 12;
      "window.restoreFullscreen" = true;
      "window.zoomLevel" = 0;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "One Dark Pro";
      "liveshare.anonymousGuestApproval" = "accept";
      "metals.bloopSbtAlreadyInstalled" = true;
      "metals.serverVersion" = "0.9.2";
    };
    # TODO Manage extensions
    # https://nixos.wiki/wiki/VSCodium
    # extensions = with pkgs.vscode-extensions; [];
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
    jq
    # TODO Handle tpm / plugins installation
    # TODO Rofi fails to start: rofi glibLocales
    # TODO zsh / zplug integration https://github.com/rycee/home-manager/blob/1b210e7143547ce0f41e8082b8d27e9c7d220351/modules/programs/zplug.nix
  ];

  services.lorri.enable = true;

  # TODO Service is not started: https://github.com/rycee/home-manager#graphical-services
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
