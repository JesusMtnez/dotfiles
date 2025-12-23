{ pkgs, ... }:
{
  home.username = "jesus";
  home.homeDirectory = "/home/jesus";

  nixpkgs = {
    config.allowUnfree = true;
    config.packageOverrides = {
      jre = pkgs.jre25_minimal;
      jdk = pkgs.jdk25_headless;
    };
  };

  imports = [
    ../../applications/direnv.nix
    ../../applications/git.nix
    ../../applications/sbt.nix
    ../../applications/zsh
  ];

  catppuccin = {
    enable = true;
    flavor = "frappe";
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    scala-cli
    neovim

    # Fonts
    nerd-fonts.iosevka-term
    (iosevka-bin.override { variant = "SGr-IosevkaTerm"; })
    (iosevka-bin.override { variant = "Aile"; })
  ];

  programs.home-manager.enable = true;
  programs.jq.enable = true;
  programs.java.enable = true;

  home.stateVersion = "25.05";
}
