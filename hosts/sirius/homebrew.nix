{ ... }:
{
  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "zap";
    global.brewfile = true;
    global.noLock = true;

    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/cask-fonts"
      "homebrew/core"
      "homebrew/services"
    ];

    brews = [
      "pinentry"
      "gnupg"
      "protobuf"
      "switchaudio-osx"
      "watch"
    ];

    casks = [
      "amethyst"
      "brave-browser"
      "calibre"
      "coconutbattery"
      "dbeaver-community"
      "discord"
      "dropbox"
      "firefox"
      "font-sf-pro"
      "google-chrome"
      "graphql-playground"
      "hiddenbar"
      "iterm2"
      "itsycal"
      "joplin"
      "karabiner-elements"
      "keepassxc"
      "mongodb-compass"
      "mounty"
      "notion"
      "openvpn-connect"
      "raycast"
      "shottr"
      "slack"
      "spotify"
      "syncthing"
      "synology-drive"
      "vlc"
      "whatsapp"
      "zoom"
    ];
  };
}
