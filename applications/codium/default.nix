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
    version = "0.18.0";
    sha256 = "0hl6bpynr6a5b7c94lxa9wsdxfii83008s0fyay9k60c14wfaxa2";
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
    version = "1.10.3";
    sha256 = "0m4qm1z1j6gfqjjnxl8v48ga7zkaspjy3gcnkrch3aj4fyafjl09";
  };

  zbr.vscode-ansible = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-ansible";
    publisher = "zbr";
    version = "0.3.2";
    sha256 = "1b26c3qh4ppgfj0p59m2mzkyfxdpagjb1vlhqlbdk6wa9vpxhkmf";
  };

  zhuangtongfa.material-theme = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "material-theme";
    publisher = "zhuangtongfa";
    version = "3.10.13";
    sha256 = "0i0l1nmbniic5qmxs3v09z7hazbrwi167cgh0hl2cvb49kdsalc6";
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
