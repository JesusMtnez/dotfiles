{ config, pkgs, unstable, ... }:
let
  sleek = pkgs.callPackage ../../applications/sleek { };
in
{
  imports = [
    ../../applications/code
    ../../applications/direnv
    ../../applications/fzf
    ../../applications/git
    ../../applications/sbt
    ../../applications/zsh
  ];

  fonts.fontconfig.enable = true;

  programs = {
    bat.enable = true;
    home-manager.enable = true;
    gpg.enable = true;
    java.enable = true;
    jq.enable = true;
    ssh.enable = true;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  home.packages = with pkgs; [
    sleek

    calibre
    gimp-with-plugins
    joplin-desktop
    keepassxc
    libreoffice-qt
    masterpdfeditor4
    onlyoffice-bin
    portfolio
    protonvpn-gui
    spotify
    tdesktop
    thunderbird-bin
    todo-txt-cli
    vlc
    zoom-us
  ];

  services.dropbox.enable = true;

  services.syncthing = {
    enable = true;
    extraOptions = [ "--allow-newer-config" ];
    tray = {
      enable = true;
      package = pkgs.syncthingtray;
      command = "syncthingtray --wait";
    };
  };

  home.stateVersion = "22.11";
}
