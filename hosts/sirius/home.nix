{ config, pkgs, ... }:
{
  home.username = "jesus";
  home.homeDirectory = "/home/jesus";

  imports = [
    ../../applications/direnv.nix
    ../../applications/git.nix
    ../../applications/neovim.nix
    ../../applications/zsh
  ];

  catppuccin = {
    enable = true;
    flavor = "frappe";
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.iosevka-term
    (iosevka-bin.override { variant = "SGr-IosevkaTerm"; })
    (iosevka-bin.override { variant = "Aile"; })
  ];
  
  programs.home-manager.enable = true;
  programs.jq.enable = true;

  home.stateVersion = "25.05";
}