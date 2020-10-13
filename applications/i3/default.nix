{ pkgs, ... }:
{
  home.packages = with pkgs; [
    numlockx
  ];

  xdg.configFile."i3/config".source = ./config;
  xdg.configFile."i3/i3status.conf".source = ./i3status.conf;
}
