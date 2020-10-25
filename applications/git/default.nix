{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
    gitAndTools.diff-so-fancy
  ];

  home.file.".gitconfig".source = ./gitconfig;
  home.file.".gitignore".source = ./gitignore;

  programs.gh = {
    enable = true;
    editor = "emacs";
    gitProtocol = "ssh";
  };
}
