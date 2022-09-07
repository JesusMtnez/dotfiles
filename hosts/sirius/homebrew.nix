{ ... }:
{
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
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
      { name = "switchaudio-osx"; }
      { name = "watch"; }
    ];

    casks = [
      { name = "amethyst"; }
      { name = "brave-browser"; }
      { name = "calibre"; }
      { name = "coconutbattery"; }
      { name = "dbeaver-community"; }
      { name = "discord"; }
      { name = "dropbox"; }
      { name = "firefox"; }
      { name = "font-sf-pro"; }
      { name = "google-chrome"; }
      { name = "graphql-playground"; }
      { name = "hiddenbar"; }
      { name = "iterm2"; }
      { name = "itsycal"; }
      { name = "joplin"; }
      { name = "karabiner-elements"; }
      { name = "keepassxc"; }
      { name = "mongodb-compass"; }
      { name = "mounty"; }
      { name = "notion"; }
      { name = "openvpn-connect"; }
      { name = "raycast"; }
      { name = "shottr"; }
      { name = "slack"; }
      { name = "spotify"; }
      { name = "syncthing"; }
      { name = "synology-drive"; }
      { name = "vlc"; }
      { name = "whatsapp"; }
      { name = "zoom"; }
    ];
  };
}
