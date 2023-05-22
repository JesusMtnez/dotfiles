{ ... }:
{
  homebrew = {
    enable = true;
    onActivation.autoUpdate = false;
    onActivation.upgrade = false;
    onActivation.cleanup = "zap";
    global.brewfile = true;
    global.lockfiles = true;

    taps = [
      { name = "homebrew/bundle"; }
      { name = "homebrew/cask-drivers"; }
      { name = "homebrew/cask-fonts"; }
      { name = "homebrew/services"; }
    ];

    brews = [
      { name = "pinentry"; }
      { name = "gnupg"; }
    ];

    casks = [
      { name = "coconutbattery"; }
      { name = "dropbox"; }
      { name = "firefox"; }
      { name = "font-sf-pro"; }
      { name = "google-chrome"; greedy = true; }
      { name = "joplin"; }
      { name = "keepassxc"; }
      { name = "marta"; }
      { name = "mounty"; }
      { name = "openvpn-connect"; }
      { name = "raycast"; }
      { name = "spotify"; }
      { name = "syncthing"; }
      { name = "synology-drive"; }
    ];
  };
}
