let
  sources = import ./nix/sources.nix;
  nixpkgs = sources.nixpkgs-unstable;
  home-manager = sources.home-manager;
  niv = sources.niv;
  pkgs = import nixpkgs { };
in
pkgs.mkShell rec {
  name = "home-manager-shell";

  buildInputs = with pkgs; [
    (import niv { }).niv
    nixpkgs-fmt
    (import home-manager { inherit pkgs; }).home-manager
  ];

  shellHook = ''
    export NIX_PATH="nixpkgs=${nixpkgs}:home-manager=${home-manager}"
  '';
  # export HOME_MANAGER_CONFIG="./home.nix"
}
