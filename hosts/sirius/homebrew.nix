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
      "syncthing"
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
      "font-sf-pro"
      "google-chrome"
      "graphql-playground"
      "hiddenbar"
      "intellij-idea-ce"
      "iterm2"
      "itsycal"
      "joplin"
      "karabiner-elements"
      "keepassxc"
      "mounty"
      "notion"
      "openvpn-connect"
      "raycast"
      "robo-3t"
      "shottr"
      "slack"
      "spotify"
      "synology-drive"
      "vlc"
      "whatsapp"
      "zoom"
    ];
  };
}
