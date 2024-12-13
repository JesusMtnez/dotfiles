{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    catppuccin.enable = true;

    font = {
      name = "IosevkaTerm Nerd Font";
      size = 9.0;
    };
  };
}
