{ pkgs, latestPkgs, lib, nix-vscode-extensions-overlay, ... }:
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

  systemd.user.services.syncthingtray.Service.ExecStart = lib.mkForce "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/sleep 5; ${pkgs.syncthingtray-minimal}/bin/syncthingtray --wait'";

  home.packages = with pkgs; [
    audacity
    latestPkgs.brave
    latestPkgs.calibre
    latestPkgs.dbeaver-bin
    latestPkgs.discord
    firefox
    latestPkgs.gimp-with-plugins
    latestPkgs.libreoffice-qt
    latestPkgs.joplin-desktop
    latestPkgs.kdePackages.kdenlive
    latestPkgs.krita
    keepassxc
    masterpdfeditor4
    transmission_4-qt6
    vlc
  ];

  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;
    update.onActivation = true;
    update.auto.enable = true;
    update.auto.onCalendar = "daily";

    packages = [
      "org.audacityteam.Audacity"
      "com.calibre_ebook.calibre"
      "com.discordapp.Discord"
      "org.filezillaproject.Filezilla"
      "info.portfolio_performance.PortfolioPerformance"
      "com.github.ransome1.sleek"
      "com.spotify.Client"
      "org.telegram.desktop"
    ];
  };

  home.stateVersion = "25.05";
}
