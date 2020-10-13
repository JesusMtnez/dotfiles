{ ... }:
{
  programs.rofi.enable = true;

  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  xdg.configFile."rofi/slate.rasi".source = ./slate.rasi;
}
