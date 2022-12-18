{ config, pkgs, unstable, ... }:
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
    calibre
    evince
    gimp-with-plugins
    joplin-desktop
    keepassxc
    libreoffice-fresh
    masterpdfeditor4
    onlyoffice-bin
    spotify
    synology-drive-client
    zoom-us
    thunderbird-bin
    vlc
  ];

  services.dropbox.enable = true;

  services.syncthing = {
    enable = true;
    extraOptions = [ "--allow-newer-config" ];
  };

  home.stateVersion = "22.11";
}
