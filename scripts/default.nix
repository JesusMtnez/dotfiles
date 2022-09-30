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
        nix flake update
        code-ext-update
      ;;

      "clean")
        nix-collect-garbage -d
        sudo nix-collect-garbage -d

      "build")
      ;;

      "switch")
      ;;

      "news")
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
