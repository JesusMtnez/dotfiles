{

  description = "JesusMtnez's dotfiles flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home }: {
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
  };
}
