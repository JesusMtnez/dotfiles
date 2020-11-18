{ pkgs, ... }:
{
  home.packages = [
    (pkgs.coursier.override { jre = pkgs.jdk11_headless; })
  ];
}
