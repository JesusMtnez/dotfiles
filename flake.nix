{

  description = "JesusMtnez's dotfiles flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    home = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-master.url = "github:nixos/nixpkgs";

  };

  outputs = inputs @ { self, nixpkgs, home, darwin, nixpkgs-master, ... }:
    let
      systems = [
        "x86_64-linux"
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
          modules = [
            ./hosts/common.nix
            ./hosts/albus/configuration.nix

            home.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit (inputs);
                  latestPkgs = mkPkgsFor "x86_64-linux" nixpkgs-master;
                };
                users.jmartinez = import ./hosts/albus/default.nix;
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
            ./hosts/common.nix
            ./hosts/darwin-bootstrap.nix
          ];
        };

        sirius = darwin.lib.darwinSystem {
          inputs = { inherit nixpkgs; };
          system = "aarch64-darwin";
          modules = [
            ./hosts/common.nix
            ./hosts/sirius/configuration.nix
            ./hosts/sirius/homebrew.nix

            home.darwinModule
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit (inputs);
                  latestPkgs = mkPkgsFor "aarch64-darwin" nixpkgs-master;
                };
                users.jmartinez = import ./hosts/sirius/default.nix;
              };
            }
          ];
        };

        severus = darwin.lib.darwinSystem {
          inputs = { inherit nixpkgs; };
          system = "x86_64-darwin";
          modules = [
            ./hosts/common.nix
            ./hosts/severus/configuration.nix
            ./hosts/severus/homebrew.nix

            home.darwinModule
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit (inputs);
                  latestPkgs = mkPkgsFor "x86_64-darwin" nixpkgs-master;
                };
                users.jmartinez = import ./hosts/severus/default.nix;
              };
            }
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
