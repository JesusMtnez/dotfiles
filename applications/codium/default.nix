{ pkgs, ... }:
let
  vscoss.vscode-ansible = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-ansible";
    publisher = "vscoss";
    version = "0.6.0";
    sha256 = "0iqy8k16k4f3gdchmhcviklhwcbzx308295qzhrsi59jlm58c0x2";
  };

  rubymaniac.vscode-direnv = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-direnv";
    publisher = "rubymaniac";
    version = "0.0.2";
    sha256 = "1gml41bc77qlydnvk1rkaiv95rwprzqgj895kxllqy4ps8ly6nsd";
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
    version = "4.5.0";
    sha256 = "1mp069j9262ds7f9rx05lhvm85072bx4lyj5nicplmjwwwhf6jwl";
  };

  zhuangtongfa.material-theme = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "material-theme";
    publisher = "zhuangtongfa";
    version = "3.9.15";
    sha256 = "0njigdh9krqhbxvqx9kp6clgavgwdmq42m4fxvfv8hm6s1k4i2mb";
  };

  scalameta.metals = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "metals";
    publisher = "scalameta";
    version = "1.10.0";
    sha256 = "0ajrq4pq3x17j3x8pxshp89nmvl0l39mzza8azsimh3f7yysnfh4";
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
      "liveshare.anonymousGuestApproval" = "accept";
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

    extensions = with pkgs.vscode-extensions; [
      bbenoist.Nix
      scala-lang.scala
      ms-vsliveshare.vsliveshare
      redhat.vscode-yaml
    ] ++ [
      scalameta.metals
      mattn.lisp
      vscoss.vscode-ansible
      rubymaniac.vscode-direnv
      pkief.material-icon-theme
      zhuangtongfa.material-theme
    ];
  };
}
