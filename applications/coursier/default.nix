{ pkgs, ... }:
{
  home.packages = [
    (pkgs.coursier.override { jre = pkgs.graalvm11-ce; })
  ];
}
