{ config, pkgs, latestPkgs, lib, ... }:
let
  sleek = pkgs.callPackage ../../packages/sleek.nix { };
in
{
  imports = [
    ../../applications/alacritty.nix
    ../../applications/code.nix
    ../../applications/direnv.nix
    ../../applications/git.nix
    ../../applications/neovim.nix
    ../../applications/sbt.nix
    ../../applications/zsh

    ../../home-manager/services/protonmail-bridge.nix
  ];

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

  services.protonmail-bridge = {
    enable = true;
    nonInteractive = true;
  };

  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
      package = pkgs.syncthingtray-minimal;
    };
  };

  systemd.user.services.syncthingtray.Service.ExecStart = lib.mkForce "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/sleep 5; ${pkgs.syncthingtray-minimal}/bin/syncthingtray --wait'";

  home.packages = with pkgs; [
    audacity
    calibre
    drawing
    firefox
    gimp-with-plugins
    latestPkgs.joplin-desktop
    keepassxc
    libreoffice-qt
    masterpdfeditor4
    latestPkgs.portfolio
    protonvpn-gui
    sleek
    spotify
    tdesktop
    thunderbird-bin
    usbimager
    vlc
  ];

  home.stateVersion = "23.11";
}
