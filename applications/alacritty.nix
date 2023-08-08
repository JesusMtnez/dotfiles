{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;

    settings = {

      font = {
        normal = {
          # family = "FiraCode Nerd Font";
          family = "Iosevka Nerd Font";
          style = "Regular";
        };
        size = if pkgs.stdenv.hostPlatform.isDarwin then 12.0 else 9.0;
        builtin_box_drawing = true;
      };

      colors = {
        # source: https://unpkg.com/browse/alacritty-themes@4.1.5/themes/One-Dark.yml
        primary = {
          background = "#282c34";
          foreground = "#abb2bf";
        };

        normal = {
          black = "#282c34";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#828791";
        };

        bright = {
          black = "#5c6370";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#e6efff";
        };
      };
    };
  };
}
