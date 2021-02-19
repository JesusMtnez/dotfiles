{ pkgs, ... }:
{
  # TODO Install zplug with nix https://github.com/rycee/home-manager/blob/1b210e7143547ce0f41e8082b8d27e9c7d220351/modules/programs/zplug.nix

  home.packages = [ pkgs.zsh ];

  home.file.".zshrc".source = ./zshrc;

  xdg.configFile."zsh" = {
    recursive = true;
    source = ./config;
  };

  home.file.".local/bin" = {
    recursive = true;
    source = ./bin;
  };

}
