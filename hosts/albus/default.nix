{ pkgs, latestPkgs, lib, ... }:
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
      package = pkgs.syncthingtray-minimal;
    };
  };

  systemd.user.services.syncthingtray.Service.ExecStart = lib.mkForce "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/sleep 5; ${pkgs.syncthingtray-minimal}/bin/syncthingtray --wait'";

  home.packages = with pkgs; [
    anytype
    audacity
    calibre
    drawing
    firefox
    gimp-with-plugins
    latestPkgs.joplin-desktop
    keepassxc
    libreoffice-fresh
    masterpdfeditor4
    mullvad-browser
    latestPkgs.portfolio
    protonvpn-gui
    # sleek
    spotify
    tdesktop
    thunderbird-bin
    usbimager
    vlc

    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-panel
    gnomeExtensions.paperwm
    gnomeExtensions.space-bar
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
  ];

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme.name = "Adwaita-dark";
  };

  dconf.settings = {
    # ...
    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "dash-to-panel@jderose9.github.com"
        # "paperwm@paperwm.github.com"
        "space-bar@luchrioh"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
      ];
    };
  };

  # See: https://github.com/nix-community/home-manager/issues/2064
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  home.stateVersion = "24.05";
}
