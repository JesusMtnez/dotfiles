{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;

    settings = {
      font = {
        normal = {
          family = "IosevkaTerm Nerd Font";
          style = "Regular";
        };
        size = if pkgs.stdenv.hostPlatform.isDarwin then 12.0 else 9.0;
        builtin_box_drawing = true;
      };
    };
  };

  catppuccin.alacritty.enable = true;
}
