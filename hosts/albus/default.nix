{ pkgs, latestPkgs, lib, ... }:

let
  sleek = pkgs.callPackage ../../packages/sleek.nix { };
in
{
  imports = [
    ../../applications/code.nix
    ../../applications/direnv.nix
    ../../applications/git.nix
    ../../applications/kitty.nix
    ../../applications/neovim.nix
    ../../applications/sbt.nix
    ../../applications/zsh
  ];

  catppuccin.flavor = "frappe";

  fonts.fontconfig.enable = true;

  programs = {
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

  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
      package = pkgs.syncthingtray;
    };
  };

  systemd.user.services.syncthingtray.Service.ExecStart = lib.mkForce "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/sleep 5; ${pkgs.syncthingtray-minimal}/bin/syncthingtray --wait'";

  home.packages = with pkgs; [
    audacity
    brave
    calibre
    drawing
    latestPkgs.dbeaver-bin
    discord
    filezilla
    firefox
    gimp
    latestPkgs.joplin-desktop
    kdePackages.kdenlive
    kdePackages.isoimagewriter
    keepassxc
    krita
    libreoffice-qt6-fresh
    masterpdfeditor4
    sleek
    spotify
    tdesktop
    transmission_4-qt6
    unrar
    vlc
  ];

  home.stateVersion = "24.11";
}
