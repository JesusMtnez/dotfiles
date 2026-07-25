{
  pkgs,
  osConfig ? null,
  ...
}:
let
  isNixOS = osConfig != null && osConfig ? nix;
in
{
  programs.kitty = {
    enable = true;
    package = if isNixOS then pkgs.kitty else pkgs.emptyDirectory;

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
