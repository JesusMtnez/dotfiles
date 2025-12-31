{
  pkgs,
  latestPkgs,
  lib,
  nix-vscode-extensions-overlay,
  ...
}:
{
  nixpkgs = {
    config.allowUnfree = true;
    config.packageOverrides = {
      jre = pkgs.jre25_minimal;
      jdk = pkgs.jdk25_headless;
    };
    overlays = [
      nix-vscode-extensions-overlay
    ];
  };

  imports = [
    ../../applications/code.nix
    ../../applications/direnv.nix
    ../../applications/git.nix
    ../../applications/kitty.nix
    ../../applications/neovim.nix
    ../../applications/sbt.nix
    ../../applications/zsh
  ];

  catppuccin = {
    enable = true;
    flavor = "frappe";
  };

  fonts.fontconfig.enable = true;

  programs = {
    autofirma.enable = true;
    autofirma.firefoxIntegration.profiles.default.enable = true;
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

  systemd.user.services.syncthingtray.Service.ExecStart =
    lib.mkForce "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/sleep 5; ${pkgs.syncthingtray-minimal}/bin/syncthingtray --wait'";

  home.packages = with pkgs; [
    audacity
    latestPkgs.brave
    latestPkgs.calibre
    latestPkgs.dbeaver-bin
    latestPkgs.discord
    firefox
    filezilla
    latestPkgs.gimp-with-plugins
    latestPkgs.joplin-desktop
    latestPkgs.kdePackages.kdenlive
    latestPkgs.krita
    keepassxc
    latestPkgs.libreoffice-qt
    masterpdfeditor4
    latestPkgs.portfolio
    latestPkgs.spotify
    latestPkgs.sleek-todo
    transmission_4-qt6
    vlc
    telegram-desktop
  ];

  home.stateVersion = "25.05";
}
