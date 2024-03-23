{

  description = "JesusMtnez's dotfiles flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    home = {
      url = "github:nix-community/home-manager/release-23.11";
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
  };

  outputs = inputs @ { self, nixpkgs, home, darwin, nixpkgs-master, nix-vscode-extensions, ... }:
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
                users.jesus = import ./hosts/albus/default.nix;
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

        ron = darwin.lib.darwinSystem {
          inputs = { inherit nixpkgs; };
          system = "aarch64-darwin";
          specialArgs = {
            nix-vscode-extensions-overlay = nix-vscode-extensions.overlays.default;
          };
          modules = [
            ./hosts/common.nix
            ./hosts/ron/configuration.nix
            # ./hosts/ron/homebrew.nix

            home.darwinModule
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  latestPkgs = mkPkgsFor "aarch64-darwin" nixpkgs-master;
                };
                users.jesus = import ./hosts/ron/default.nix;
              };
            }
          ];
        };

        severus = darwin.lib.darwinSystem {
          inputs = { inherit nixpkgs; };
          system = "x86_64-darwin";
          specialArgs = {
            nix-vscode-extensions-overlay = nix-vscode-extensions.overlays.default;
          };
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
                  isWorkstation = false;
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
