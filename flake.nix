{

  description = "JesusMtnez's dotfiles flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    home = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    autofirma = {
      url = "github:nix-community/autofirma-nix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-master, home, nix-flatpak, nix-vscode-extensions, catppuccin, autofirma, ... }:
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
        albus = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            nix-vscode-extensions-overlay = nix-vscode-extensions.overlays.default;
          };
          modules = [
            ./hosts/common.nix
            ./hosts/albus/configuration.nix
            nix-flatpak.nixosModules.nix-flatpak

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
      };

      homeConfigurations = {
        work = home.lib.homeManagerConfiguration {
          pkgs = mkPkgsFor "x86_64-linux" nixpkgs;
          modules = [
            ./hosts/work/home.nix
            catppuccin.homeModules.catppuccin
          ];
          extraSpecialArgs = {
            latestPkgs = mkPkgsFor "x86_64-linux" nixpkgs-master;
          };
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
