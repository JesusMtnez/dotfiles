{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    font = {
      name = "IosevkaTerm Nerd Font";
      size = 9.0;
    };
  };

  catppuccin.kitty.enable = true;
}
