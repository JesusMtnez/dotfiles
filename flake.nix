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
      url = "github:catppuccin/nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    autofirma = {
      url = "github:nix-community/autofirma-nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-master,
      home,
      nix-flatpak,
      nix-vscode-extensions,
      catppuccin,
      autofirma,
      ...
    }:
    let
      allSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems =
        f:
        nixpkgs.lib.genAttrs allSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
            latest = import nixpkgs-master { inherit system; };
          }
        );

      mkPkgsFor =
        system: pkgset:
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
          specialArgs = { };
          modules = [
            ./hosts/common.nix
            ./hosts/albus/configuration.nix

            home.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                extraSpecialArgs = {
                  latestPkgs = mkPkgsFor "x86_64-linux" nixpkgs-master;
                  nix-vscode-extensions-overlay = nix-vscode-extensions.overlays.default;
                };
                users.jesus = {
                  imports = [
                    catppuccin.homeModules.catppuccin
                    autofirma.homeManagerModules.default
                    nix-flatpak.homeManagerModules.nix-flatpak
                    ./hosts/albus/default.nix
                  ];
                };
              };
            }
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

      formatter = forAllSystems ({ pkgs, latest }: pkgs.nixfmt-tree);

      devShell = forAllSystems (
        { pkgs, latest }:
        pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            nixfmt-tree
          ];
        }
      );
    };
}
