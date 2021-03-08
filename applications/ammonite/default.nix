{ pkgs, ... }:
{
  home.packages = [
    (pkgs.ammonite_2_13.override { jre = pkgs.graalvm11-ce; })
  ];
}
