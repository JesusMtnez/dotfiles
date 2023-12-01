{ ... }: {
  nix.configureBuildUsers = true;
  nix.settings.trusted-users = [ "@admin" ];
  services.nix-daemon.enable = true;
  system.stateVersion = 4;
}
