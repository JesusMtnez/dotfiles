{

  description = "JesusMtnez's dotfiles flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    nixpkgs_24_11.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    home = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs_24_11";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs_24_11";
    };

    catppuccin.url = "github:catppuccin/nix";

    autofirma = {
      url = "github:nix-community/autofirma-nix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs_24_11";
    };
  };

  outputs = { nixpkgs_24_11, nixpkgs, nixpkgs-master, home, darwin, nix-vscode-extensions, catppuccin, autofirma, ... }:
    let
      allSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
        latest = import nixpkgs-master { inherit system; };
      });

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
        albus = nixpkgs_24_11.lib.nixosSystem {
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
                    catppuccin.homeModules.catppuccin
                    ./hosts/albus/default.nix
                  ];
                };
              };
            }

            autofirma.nixosModules.default
          ];
        };

        minerva = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/minerva/configuration.nix
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

      devShell = forAllSystems ({ pkgs, latest }:
        pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            nixpkgs-fmt
          ];
        }
      );
    };
}
