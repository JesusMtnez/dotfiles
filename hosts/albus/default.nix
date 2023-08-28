{ config, pkgs, latestPkgs, lib, ... }:
let
  sleek = pkgs.callPackage ../../applications/sleek { };
in
{
  imports = [
    ../../applications/alacritty.nix
    ../../applications/code
    ../../applications/direnv
    ../../applications/git
    ../../applications/neovim.nix
    ../../applications/zsh
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

  home.packages = [
    # sleek
  ] ++ (with pkgs; [
    audacity
    calibre
    drawing
    firefox
    gimp-with-plugins
    latestPkgs.joplin-desktop
    keepassxc
    libreoffice
    masterpdfeditor4
    latestPkgs.portfolio
    protonvpn-gui
    spotify
    tdesktop
    thunderbird-bin
    vlc
  ]);

  # services.syncthing = {
  #   enable = true;
  #   extraOptions = [ "--allow-newer-config" ];
  #   tray = {
  #     enable = true;
  #     package = pkgs.syncthingtray-minimal;
  #   };
  # };

  # systemd.user.services.syncthingtray.Service.ExecStart = lib.mkForce "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/sleep 5; ${pkgs.syncthingtray-minimal}/bin/syncthingtray --wait'";

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme.name = "Adwaita-dark";
  };

  home.stateVersion = "23.05";
}
