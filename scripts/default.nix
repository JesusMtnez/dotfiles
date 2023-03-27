{ pkgs, lib, ... }:

let
  dotTool = with pkgs; writeScriptBin "dot" ''
    #!${runtimeShell}

    pushd $HOME/.dotfiles > /dev/null

    case $1 in
      "fmt")
        ${nixpkgs-fmt}/bin/nixpkgs-fmt .
      ;;

      "update")
        nix flake update
        code-ext-update
      ;;

      "clean")
        nix-store --gc
        sudo nix-store --gc
        nix-collect-garbage -d
        sudo nix-collect-garbage -d
      ;;

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
