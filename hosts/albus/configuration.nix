{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix = {
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "-d";
    };
    settings = {
      auto-optimise-store = true;
    };
  };

  boot = {
    # https://www.kernel.org/category/releases.html
    kernelPackages = pkgs.linuxPackages_latest;

    kernelModules = [ "kvm-intel" ];

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = [ "ntfs" ];
  };

  time.timeZone = "Europe/Madrid";

  networking = {
    hostName = "albus";
    interfaces.eno1.useDHCP = true;
    networkmanager.enable = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  services.xserver = {
    enable = true;

    xkb.layout = "us";
    xkb.variant = "altgr-intl";
    xkb.options = "ctrl:nocaps";

    videoDrivers = [ "nouveau" ];
  };

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
  };

  hardware.graphics.enable = true;

  services.libinput.enable = true;

  services.fwupd.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    nssmdns6 = true;
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.brlaser ];
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth.enable = true;

  users.users.jesus = {
    isNormalUser = true;
    description = "Jesús";
    extraGroups = [ "wheel" "docker" "network" "libvirtd" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    # apps
    kdePackages.isoimagewriter
    unrar
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];

  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
    autofirma.enable = true;
    autofirma.firefoxIntegration.enable = true;
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    virt-manager.enable = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = [ pkgs.virtiofsd ];
  };

  fonts.packages = with pkgs; [
    corefonts
    vista-fonts
  ];

  services.flatpak = {
    enable = true;
    uninstallUnmanaged = false;
    update.onActivation = true;
    update.auto.enable = true;
    update.auto.onCalendar = "daily";

    packages = [
      "org.audacityteam.Audacity"
      "com.brave.Browser"
      "com.calibre_ebook.calibre"
      "io.dbeaver.DBeaverCommunity"
      "com.discordapp.Discord"
      "org.filezillaproject.Filezilla"
      "org.gimp.GIMP"
      "org.kde.kcalc"
      "org.kde.kdenlive"
      "org.kde.krita"
      "org.libreoffice.LibreOffice"
      "info.portfolio_performance.PortfolioPerformance"
      "com.github.ransome1.sleek"
      "com.spotify.Client"
      "org.telegram.desktop"
    ];
  };

  system.stateVersion = "25.05";
}
