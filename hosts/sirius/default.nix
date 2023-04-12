{ config, lib, pkgs, ... }:

let
  homedir = builtins.getEnv "HOME";
in
{
  programs.home-manager.enable = true;

  imports = [
    ../../applications/code
    ../../applications/direnv
    ../../applications/fzf
    ../../applications/git
    ../../applications/sbt
    ../../applications/zsh
    ../../scripts
  ];

  fonts.fontconfig.enable = true;

  programs.java.enable = true;

  home.packages = with pkgs; [
    cachix

    # Cli tools
    bat
    jq

    # Global dev tools
    ammonite_2_13
    coursier
    kubectl
    awscli2
  ];

  # Home-manager does not link installed applications to the user environment.
  # https://github.com/nix-community/home-manager/issues/1341
  home.activation = pkgs.lib.mkIf pkgs.stdenv.isDarwin
    {
      addApplications =
        let
          apps = pkgs.buildEnv {
            name = "home-manager-applications";
            paths = config.home.packages;
            pathsToLink = "/Applications";
          };
        in
        lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          baseDir="$HOME/Applications/Home Manager Apps"
          if [ -d "$baseDir" ]; then
            rm -rf "$baseDir"
          fi
          mkdir -p "$baseDir"
          for appFile in ${apps}/Applications/*; do
            target="$baseDir/$(basename "$appFile")"
            $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$baseDir"
            $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
          done
        '';
    };

  home.stateVersion = "22.11";
}
