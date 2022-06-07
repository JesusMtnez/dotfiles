{ config, pkgs, ... }:
{
  nixpkgs.config.packageOverrides = {
    jdk = pkgs.graalvm11-ce;
    jre = pkgs.graalvm11-ce;
  };

  users.users.jmartinez.home = "/Users/jmartinez";
}
