{ pkgs, lib, ... }:

let
  dotTool = with pkgs; writeScriptBin "dot" ''
    #!${runtimeShell}

    pushd $HOME/.dotfiles > /dev/null

    case $1 in
      "fmt")
        FILES=$(${git}/bin/git ls-files '*.nix' | grep -v 'nix/.*' | tr '\n' ' ')
        ${nixpkgs-fmt}/bin/nixpkgs-fmt $FILES
      ;;

      "update")
        nix-shell --run "niv update"
        code-ext-update
      ;;

      "build")
        nix-shell --run "home-manager build"
      ;;

      "switch")
        nix-shell --run "home-manager switch"
      ;;

      "news")
        nix-shell --run "home-manager news"
      ;;
      *)
        echo "Usage:"
        echo "dot command"
      ;;
    esac

    popd > /dev/null
  '';
in
{
  home.packages = [
    dotTool
  ];
}
