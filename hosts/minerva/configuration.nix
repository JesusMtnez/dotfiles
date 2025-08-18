{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.trusted-users = [ "admin" ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "kvm-intel" ];

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;
      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = [ "ntfs" ];
  };

  networking = {
    hostName = "minerva";
    useDHCP = false;
    interfaces."enp2s0".useDHCP = true;
    wireless.enable = false;
  };

  time.timeZone = "Europe/Madrid";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
    options = "ctrl:nocaps";
  };

  users.users = {
    "admin" = {
      isNormalUser = true;
      description = "administrator";
      extraGroups = [ "wheel" "docker" ];
      packages = with pkgs; [ vim ];
    };
  };

  environment.systemPackages = with pkgs; [ ];

  networking.firewall.enable = false;

  services = {
    fwupd.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = true;
    };

    k3s = {
      enable = true;
      package = pkgs.k3s_1_33;
      role = "server";
      extraFlags = [
        "--disable coredns"
        "--disable traefik"
        "--disable metrics-server"
        "--disable servicelb"
        "--disable local-storage"
      ];
    };

    openssh.enable = true;
  };

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
    extraPackages = [
      pkgs.docker-compose
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
