{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "padfoot";
  networking.wireless.enable = false;
  networking.firewall.enable = false;
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Madrid";

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

  services.xserver.enable = true;
  services.xserver.displayManager = {
    sddm.enable = true;
    autoLogin.enable = true;
    autoLogin.user = "jesus";
    defaultSession = "plasmawayland";
  };
  services.xserver.desktopManager.plasma5.enable = true;

  services.xserver = {
    layout = "us";
    xkbVariant = "mac";
  };

  services.xserver.libinput.enable = true;

  # Enable sound with pipewire.
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jesus = {
    isNormalUser = true;
    description = "Jesus Martinez";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.ark

    cachix
    git
    neovim
  ];

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

  services.openssh.enable = true;

  services.spice-vdagentd.enable = true;

  system.stateVersion = "23.05";
}
