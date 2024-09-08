{

  description = "JesusMtnez's dotfiles flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    home = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home, darwin, nixpkgs-master, nix-vscode-extensions, catppuccin, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;

      mkPkgsFor = system: pkgset:
        import pkgset {
          inherit system;
          config = {
            allowUnfree = true;
          };
        };
    in
    {
      nixosConfigurations = {
        albus = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            nix-vscode-extensions-overlay = nix-vscode-extensions.overlays.default;
          };
          modules = [
            ./hosts/common.nix
            ./hosts/albus/configuration.nix

            home.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  latestPkgs = mkPkgsFor "x86_64-linux" nixpkgs-master;
                };
                users.jesus = {
                  imports = [
                    catppuccin.homeManagerModules.catppuccin
                    ./hosts/albus/default.nix
                  ];
                };
              };
            }
          ];
        };
      };

      darwinConfigurations = {
        bootstrap = darwin.lib.darwinSystem {
          system = "aarch64-darwin"; # TODO Make it compatible with system "x86_64-darwin"
          inputs = { inherit nixpkgs; };
          modules = [
            ./hosts/darwin-bootstrap.nix
          ];
        };
      };

      devShell = forAllSystems
        (system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
          in
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              nixpkgs-fmt
            ];
          }
        );
    };
}
