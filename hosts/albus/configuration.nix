{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_5_15;
    blacklistedKernelModules = [ "nouveau" ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  time.timeZone = "Europe/Madrid";

  networking = {
    hostName = "albus";
    useDHCP = false;
    interfaces.enp0s31f6.useDHCP = true;
    networkmanager.enable = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    desktopManager.xfce = {
      enable = true;
      noDesktop = false;
      enableXfwm = true;
      enableScreensaver = false;
    };

    displayManager.gdm.enable = true;

    layout = "us";
    xkbVariant = "altgr-intl";
    xkbOptions = "ctrl:nocaps";

    videoDrivers = [ "nvidia" ];

    libinput.enable = true;
  };

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-dropbox-plugin
    thunar-volman
  ];

  services.gnome.gnome-keyring.enable = true;

  services.avahi = {
    enable = true;
    nssmdns = true;
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.brlaser ];
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jmartinez = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "network" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    arc-theme
    papirus-icon-theme

    cachix
    brave
    firefox
    gnome.file-roller
  ];

  powerManagement.enable = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "22.11";
}
