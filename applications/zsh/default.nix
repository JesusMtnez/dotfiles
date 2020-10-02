{ pkgs, ... }:
{

  # TODO Install zsh with nix
  # TODO Install zplug with nix

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
