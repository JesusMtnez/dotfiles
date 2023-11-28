{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix = {
    package = pkgs.nixUnstable;
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
    kernelPackages = pkgs.linuxPackages_6_1;
    # https://www.kernel.org/category/releases.html

    blacklistedKernelModules = [ "nouveau" ];

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;
      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = [ "ntfs" ];
  };

  time.timeZone = "Europe/Madrid";

  networking = {
    hostName = "albus";
    useDHCP = false;
    interfaces.enp0s31f6.useDHCP = true;
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
    excludePackages = [ pkgs.xterm ];

    displayManager.lightdm = {
      enable = true;
      greeters.slick = {
        enable = true;
        theme.name = "Adawita-dark";
        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
        };
      };
    };

    desktopManager.xfce.enable = true;

    layout = "us";
    xkbVariant = "altgr-intl";
    xkbOptions = "ctrl:nocaps";

    videoDrivers = [ "nvidia" ];

    libinput.enable = true;
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.brlaser ];
  };

  hardware.opengl.enable = true;

  hardware.nvidia.modesetting.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  programs.seahorse.enable = true;

  sound.enable = true;
  sound.mediaKeys.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jesus = {
    isNormalUser = true;
    description = "Jesús";
    extraGroups = [ "wheel" "docker" "network" "libvirtd" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    # apps
    appimage-run
    cachix

    # xfce apps / tools
    blueman
    evince
    font-manager
    gnome.file-roller
    gnome.gnome-disk-utility
    pavucontrol
    wmctrl
    xcolor
    xdo
    xdotool
    xfce.orage
    xfce.xfce4-appfinder
    xfce.xfce4-clipman-plugin
    xfce.xfce4-cpugraph-plugin
    xfce.xfce4-dict
    xfce.xfce4-fsguard-plugin
    xfce.xfce4-genmon-plugin
    xfce.xfce4-netload-plugin
    xfce.xfce4-panel
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-systemload-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-xkb-plugin
    xfce.xfdashboard
    xorg.xev
    xtitle
    xwinmosaic
  ];

  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
    virt-manager.enable = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;

  fonts.packages = with pkgs; [
    corefonts
    vistafonts
  ];

  system.stateVersion = "23.11";
}
