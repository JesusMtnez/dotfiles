{ pkgs, config, ... }:

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
    kernelPackages = pkgs.linuxPackages_6_6;
    # https://www.kernel.org/category/releases.html

    kernelParams = [ "module_blacklist=i915" ];
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
    excludePackages = [ pkgs.xterm ];

    xkb.layout = "us";
    xkb.variant = "altgr-intl";
    xkb.options = "ctrl:nocaps";

    videoDrivers = [ "nvidia" ];
  };

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
  };

  services.libinput.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    nssmdns6 = true;
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.brlaser ];
  };

  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;

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
    # cachix
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
    vistafonts
  ];

  system.stateVersion = "24.11";
}
