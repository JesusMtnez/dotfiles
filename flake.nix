{

  description = "JesusMtnez's dotfiles flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-22.05-darwin";

    home = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  outputs = inputs @ { self, nixpkgs, home, darwin, nixpkgs-darwin }: {
    nixosConfigurations = {
      albus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/albus/configuration.nix

          home.nixosModules.home-manager {
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
          ./hosts/sirius/darwin-configuration.nix

          home.darwinModule {
            home-manager = {
              useGlobalPkgs = false;

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
                  # gpg.enable = true;
                  java.enable = true;
                  jq.enable = true;
                  # ssh.enable = true;
                };
              };
            };
          }
        ];
      };
    };

    darwinPkgs = self.darwinConfigurations."sirius".pkgs;
  };
}
