{ pkgs, ... }:
{
  home.packages = [
    (pkgs.ammonite_2_13.override { jre = pkgs.jdk11_headless; })
  ];
}
