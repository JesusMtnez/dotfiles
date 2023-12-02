{ config, pkgs, ... }:
{
  services.activate-system.enable = true;
  services.nix-daemon.enable = true;

  nix.configureBuildUsers = true;

  nix.gc = {
    automatic = true;
    interval = { Weekday = 0; Hour = 0; Minute = 0; };
    options = "-d";
  };

  users.users.jmartinez.home = "/Users/jmartinez";

  system.defaults.dock = {
    autohide = false;
    mru-spaces = false;
    minimize-to-application = true;
    orientation = "bottom";
    show-process-indicators = true;
    show-recents = false;
    tilesize = 16;
    static-only = false;
  };

  system.defaults.trackpad = {
    Clicking = true;
    ActuationStrength = 0; # Silent Clicking
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };
}
