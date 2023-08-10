{ config, pkgs, latestPkgs, ... }: {
  imports = [
    ../../applications/alacritty.nix
    ../../applications/code
    ../../applications/direnv
    ../../applications/git
    ../../applications/neovim.nix
    ../../applications/zsh
  ];

  fonts.fontconfig.enable = true;

  programs = {
    home-manager.enable = true;
    gpg.enable = true;
    ssh.enable = true;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  home.packages = with pkgs; [
    firefox
    keepassxc
  ];

  services.syncthing = {
    enable = true;
    extraOptions = [ "--allow-newer-config" ];
    tray = {
      enable = true;
      package = pkgs.syncthingtray;
      command = "syncthingtray --wait";
    };
  };

  home.stateVersion = "23.05";
}
