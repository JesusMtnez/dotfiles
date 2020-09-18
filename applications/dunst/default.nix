{ pkgs, ... }:
{
  home.packages = [ pkgs.dunst ];
  xdg.configFile."dunst/dunstrc".source = ./dunstrc;
}
