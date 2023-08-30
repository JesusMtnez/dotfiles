{ pkgs, nix-vscode-extensions-overlay, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    config.packageOverrides = {
      jre = pkgs.jdk17;
      jdk = pkgs.jdk17;
    };
  };

  nixpkgs.overlays = [
    nix-vscode-extensions-overlay
  ];

  nix.extraOptions = ''
    keep-derivations = true
    keep-outputs = true
    experimental-features = nix-command flakes
  '';

  nix.settings = {
    auto-optimise-store = true;
    substituters = [
      "https://cache.nixos.org/"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };

  programs.zsh.enable = true;
  programs.zsh.promptInit = "";

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "IosevkaTerm" ]; })
    (iosevka-bin.override { variant = "sgr-iosevka-term"; })
    (iosevka-bin.override { variant = "sgr-iosevka-aile"; })
  ];
}
