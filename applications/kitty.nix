{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    font = {
      name = "IosevkaTerm Nerd Font";
      size = 10.0;
    };

    settings = {
      cursor_shape = "beam";
    };
  };

  catppuccin.kitty.enable = true;
}
