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
      "metals.serverVersion" = "0.9.3";
    };
    # TODO Manage extensions
    # https://nixos.wiki/wiki/VSCodium
    # extensions = with pkgs.vscode-extensions; [];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
  };

  programs.direnv = {
    enable = true;
    enableNixDirenvIntegration = true;
  };

  home.packages = with pkgs; [
    bat
    git
    gitAndTools.diff-so-fancy
    gitAndTools.gh
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
    ".gitignore".source = dotfiles + "/gitignore";
    ".gitconfig".source = dotfiles + "/gitconfig";
    ".tmux.conf".source = dotfiles + "/tmux.conf";
    ".Xkbmap".source = dotfiles + "/Xkbmap";
    ".xprofile".source = dotfiles + "/xprofile";
    ".zshrc".source = dotfiles + "/zshrc";

    ".sbt/1.0/plugins" = {
      source = dotfiles+ "/sbt/plugins";
      recursive = true;
    };

    ".local/share/applications" = {
      source = dotfiles + "/applications";
      recursive = true;
    };
  };
}
