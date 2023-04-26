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
      { name = "homebrew/cask"; }
      { name = "homebrew/cask-drivers"; }
      { name = "homebrew/cask-fonts"; }
      { name = "homebrew/core"; }
      { name = "homebrew/services"; }
    ];

    brews = [
      { name = "pinentry"; }
      { name = "gnupg"; }
      { name = "protobuf"; }
      { name = "watch"; }
    ];

    casks = [
      { name = "amethyst"; }
      { name = "coconutbattery"; }
      { name = "dbeaver-community"; }
      { name = "dropbox"; }
      { name = "firefox"; }
      { name = "font-sf-pro"; }
      { name = "google-chrome"; greedy = true; }
      { name = "graphql-playground"; }
      { name = "hiddenbar"; }
      { name = "itsycal"; }
      { name = "joplin"; }
      { name = "keepassxc"; }
      { name = "marta"; }
      { name = "mongodb-compass"; }
      { name = "mounty"; }
      { name = "openvpn-connect"; }
      { name = "raycast"; }
      { name = "slack"; }
      { name = "sleek"; }
      { name = "spotify"; }
      { name = "syncthing"; }
      { name = "tabby"; }
      { name = "thunderbird"; }
      { name = "zoom"; }
    ];
  };
}
