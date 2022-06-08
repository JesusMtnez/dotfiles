{ config, pkgs, ... }:
{
  services.nix-daemon.enable = true;

  users.nix.configureBuildUsers = true;

  nixpkgs.config.packageOverrides = {
    jdk = pkgs.graalvm11-ce;
    jre = pkgs.graalvm11-ce;
  };

  users.users.jmartinez.home = "/Users/jmartinez";
}
