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
    dpi = 96;
    excludePackages = [ pkgs.xterm ];

    displayManager = {
      sddm.enable = true;
    };

    desktopManager.plasma5 = {
      enable = true;
      useQtScaling = true;
      kdeglobals = { };
      kwinrc = { };
    };

    layout = "us";
    xkbVariant = "altgr-intl";
    xkbOptions = "ctrl:nocaps";

    videoDrivers = [ "nvidia" ];

    libinput.enable = true;
  };

  environment.variables = {
    GDK_SCALE = "0.5";
  };

  environment.plasma5.excludePackages = with pkgs; [
    libsForQt5.elisa
    kate
    libsForQt5.khelpcenter
    konsole
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
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

  sound.enable = true;

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
    package = pkgs.bluezFull;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jmartinez = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "network" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.ark

    cachix
    git
  ];

  virtualisation.docker.enable = true;

  system.stateVersion = "23.05";
}
