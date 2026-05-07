{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    font = {
      name = "IosevkaTerm Nerd Font";
      size = 11.0;
    };

    settings = {
      cursor_shape = "beam";
    };
  };

  catppuccin.kitty.enable = true;
}
