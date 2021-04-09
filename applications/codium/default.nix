{ pkgs, ... }:
let

  bbenoist.nix = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "Nix";
    publisher = "bbenoist";
    version = "1.0.1";
    sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
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
    version = "4.6.0";
    sha256 = "0jid21l8mdh0bism7yl0awkbj9802fb880rkpnva43p61npybvcb";
  };

  redhat.vscode-yaml = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-yaml";
    publisher = "redhat";
    version = "0.17.0";
    sha256 = "0hg8bwknp2z20f6qbv4wsyc92ykw5rz5s8lr7lxw81nxmidf5201";
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
    version = "0.5.2";
    sha256 = "1b8ydigspgr2cni86cqrd0md61ks62y9qca3ia6dq11pvfdwxbsd";
  };

  scalameta.metals = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "metals";
    publisher = "scalameta";
    version = "1.10.2";
    sha256 = "05a9g7c9j6axm5nza80n1vdc78gana6628mry2xp7a00v5382pbl";
  };

  zbr.vscode-ansible = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-ansible";
    publisher = "zbr";
    version = "0.3.0";
    sha256 = "1m20dppazhi00gnwxrjf8ybbaiwgpw1795l3ln9a9fm6ddnq2jpr";
  };

  zhuangtongfa.material-theme = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "material-theme";
    publisher = "zhuangtongfa";
    version = "3.10.11";
    sha256 = "050f4ms4mkc8zn4fwfbrfp08s4sk3w5p24bdri744n0kmq27aqlk";
  };

in {
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
      bbenoist.nix
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
