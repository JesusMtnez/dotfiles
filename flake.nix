{

  description = "JesusMtnez's dotfiles flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";

    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-22.05-darwin";

    home = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-stable = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  outputs = inputs @ { self, nixpkgs, home, darwin, nixpkgs-darwin, home-stable, ... }:
    let
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
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
                users.jmartinez = {

                  imports = [
                    ./applications/code
                    ./applications/direnv
                    ./applications/fzf
                    ./applications/git
                    ./applications/sbt
                    ./applications/zsh
                  ];

                  fonts.fontconfig.enable = true;

                  programs = {
                    bat.enable = true;
                    home-manager.enable = true;
                    gpg.enable = true;
                    java.enable = true;
                    jq.enable = true;
                    ssh.enable = true;
                  };

                  services.gpg-agent = {
                    enable = true;
                    defaultCacheTtl = 1800;
                    enableSshSupport = true;
                  };

                  services.syncthing.enable = true;

                  home.stateVersion = "22.05";
                };
              };
            }
          ];
        };
      };

      darwinConfigurations = {
        bootstrap = darwin.lib.darwinSystem {
          system = "aarch64-darwin"; # TODO Make it compatible with system "x86_64-darwin"
          inputs = { inherit nixpkgs-darwin; };
          modules = [
            ./hosts/common.nix
            ./hosts/darwin-bootstrap.nix
          ];
        };

        sirius = darwin.lib.darwinSystem {
          inputs = { inherit nixpkgs-darwin; };
          system = "aarch64-darwin";
          modules = [
            ./hosts/common.nix
            ./hosts/sirius/configuration.nix
            ./hosts/sirius/homebrew.nix

            home-stable.darwinModule
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit (inputs);
                };
                users.jmartinez = import ./hosts/sirius/default.nix;
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
