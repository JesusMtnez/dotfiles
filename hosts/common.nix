{ pkgs, nix-vscode-extensions-overlay, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    config.packageOverrides = {
      jre = pkgs.jdk21;
      jdk = pkgs.jdk21;
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
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  programs.zsh.enable = true;
  programs.zsh.promptInit = "";

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term
    (iosevka-bin.override { variant = "SGr-IosevkaTerm"; })
    (iosevka-bin.override { variant = "Aile"; })
  ];
}
