{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacsGcc;
  };
}
