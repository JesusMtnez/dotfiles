{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;

    ignores = [
      # Mac OSX
      ".DS_Store"

      # Metals
      ".metals/"
      ".bloop/"
      "project/metals.sbt"
      ".bsp/"

      # Editors
      ".idea/"
      ".vscode/"
    ];
  };

  home.file.".gitconfig".source = ./gitconfig;

  home.packages = with pkgs; [
    gitAndTools.diff-so-fancy
    gitAndTools.gh
    gitAndTools.glab
  ];
}
