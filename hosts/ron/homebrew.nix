{ ... }:
{
  homebrew = {
    enable = true;
    onActivation.autoUpdate = false;
    onActivation.upgrade = false;
    onActivation.cleanup = "zap";
    global.autoUpdate = false;
    global.brewfile = true;
    global.lockfiles = true;

    taps = [
      { name = "homebrew/bundle"; }
      { name = "homebrew/cask-fonts"; }
      { name = "homebrew/services"; }
    ];

    brews = [
      { name = "pinentry"; }
      { name = "gnupg"; }
    ];

    casks = [
      { name = "autofirma"; }
      { name = "coconutbattery"; }
      { name = "firefox"; }
      { name = "font-sf-pro"; }
      { name = "mounty"; }
      { name = "openvpn-connect"; }
      { name = "sleek"; }
      { name = "spotify"; }
      { name = "syncthing"; }
      # { name = "thunderbird"; }
      # { name = "utm"; }
    ];
  };
}
