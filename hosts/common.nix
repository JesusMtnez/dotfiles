{ pkgs, ... }:
{
  nix.extraOptions = ''
    keep-derivations = true
    keep-outputs = true
    experimental-features = nix-command flakes
  '';

  programs.zsh.enable = true;
  programs.zsh.promptInit = "";

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [ (nerdfonts.override { fonts = [ "FiraCode" ]; }) ];
}
