{ pkgs, ... }:

let
  firefoxPrivate = pkgs.makeDesktopItem {
    name = "firefox-private";
    desktopName = "Firefox Private";
    icon = "firefox";
    exec = "/usr/bin/firefox --private-window";
  };

  poweroff = pkgs.makeDesktopItem {
    name = "poweroff";
    desktopName = "Poweroff";
    icon = "system-shutdown";
    exec = "/usr/bin/poweroff";
  };

  reboot = pkgs.makeDesktopItem {
    name = "reboot";
    desktopName = "Reboot";
    icon = "system-reboot";
    exec = "/usr/bin/reboot";
  };

  suspend = pkgs.makeDesktopItem {
    name = "suspend";
    desktopName = "Suspend";
    icon = "system-suspend";
    exec = "/usr/bin/systemctl suspend";
  };
in
{
  home.packages = [
    # System
    # poweroff reboot suspend

    # Browers
    firefoxPrivate
  ];
}
