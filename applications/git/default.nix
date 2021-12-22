{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
    gitAndTools.diff-so-fancy
    gitAndTools.gh
    gitAndTools.glab
  ];

  home.file.".gitconfig".source = ./gitconfig;
  home.file.".gitignore".source = ./gitignore;
}
