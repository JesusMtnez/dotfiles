{ pkgs, ... }:
let

  jnoortheen.nix-ide = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "nix-ide";
    publisher = "jnoortheen";
    version = "0.1.12";
    sha256 = "1wkc5mvxv7snrpd0py6x83aci05b9fb9v4w9pl9d1hyaszqbfnif";
  };

  mattn.lisp = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "lisp";
    publisher = "mattn";
    version = "0.1.11";
    sha256 = "1is81gmik2lc4wkil682lc34p1qcymb6xfwc942ig1msd33qv1g3";
  };

  pkief.material-icon-theme = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "material-icon-theme";
    publisher = "PKief";
    version = "4.7.0";
    sha256 = "0n8xv62l9z31gndv1lhwrsm9qjp5vliqwgn9vsp86xd0hs5ycm2w";
  };

  redhat.vscode-yaml = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-yaml";
    publisher = "redhat";
    version = "0.19.2";
    sha256 = "14rb6r09myakj2amhadnafk8abq4in5q6h4wrnksmzn0b6khk3dl";
  };

  rubymaniac.vscode-direnv = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-direnv";
    publisher = "rubymaniac";
    version = "0.0.2";
    sha256 = "1gml41bc77qlydnvk1rkaiv95rwprzqgj895kxllqy4ps8ly6nsd";
  };

  scala-lang.scala = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "scala";
    publisher = "scala-lang";
    version = "0.5.3";
    sha256 = "0isw8jh845hj2fw7my1i19b710v3m5qsjy2faydb529ssdqv463p";
  };

  scalameta.metals = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "metals";
    publisher = "scalameta";
    version = "1.10.6";
    sha256 = "11ihg8d94hfg731r280wj9nvymgd2plaw01my1mfibjxlaf1h2i3";
  };

  zbr.vscode-ansible = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-ansible";
    publisher = "zbr";
    version = "0.4.4";
    sha256 = "132dly5h9j9vnk3sx6g32idw9sdy2sy3nn2kpb1hg9k8r0ma73c5";
  };

  zhuangtongfa.material-theme = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "material-theme";
    publisher = "zhuangtongfa";
    version = "3.10.14";
    sha256 = "1dyinvp7qm5pjgylzf94rfak41p3yxwp5qp76sbdvlgnb9pss8z8";
  };

in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "editor.fontFamily" = "'FuraCode Nerd Font'";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 12;
      "editor.fontWeight" = "normal";
      "editor.renderWhitespace" = "all";
      "editor.tabSize" = 2;
      "editor.wordWrapColumn" = 100;
      "explorer.confirmDelete" = false;
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 500;
      "files.insertFinalNewline" = false;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "files.watcherExclude" = {
        "**/.ammonite" = true;
        "**/.bloop" = true;
        "**/.metals" = true;
        "**/target" = true;
      };
      "liveshare" = {
        "anonymousGuestApproval" = "accept";
        "authenticationProvider" = "GitHub";
      };
      "metals" = {
        "bloopSbtAlreadyInstalled" = true;
        "showInferredType" = true;
      };
      "oneDarkPro.vivid" = true;
      "terminal.integrated.cursorStyle" = "line";
      "terminal.integrated.fontFamily" = "'FuraCode Nerd Font'";
      "terminal.integrated.fontSize" = 12;
      "window.restoreFullscreen" = true;
      "window.zoomLevel" = 0;
      "workbench.colorTheme" = "One Dark Pro";
      "workbench.iconTheme" = "material-icon-theme";
    };

    extensions = [
      pkgs.vscode-extensions.ms-vsliveshare.vsliveshare
      jnoortheen.nix-ide
      mattn.lisp
      pkief.material-icon-theme
      redhat.vscode-yaml
      rubymaniac.vscode-direnv
      scala-lang.scala
      scalameta.metals
      zbr.vscode-ansible
      zhuangtongfa.material-theme
    ];
  };
}
