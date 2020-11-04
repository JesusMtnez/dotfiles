{ pkgs, ... }:
let
  vscoss.vscode-ansible = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-ansible";
    publisher = "vscoss";
    version = "0.5.2";
    sha256 = "0r1aqfc969354j8b1k9xsg682fynbk4xjp196f3yknlwj66jnpwx";
  };

  rubymaniac.vscode-direnv = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-direnv";
    publisher = "rubymaniac";
    version = "0.0.2";
    sha256 = "1gml41bc77qlydnvk1rkaiv95rwprzqgj895kxllqy4ps8ly6nsd";
  };

  pkief.material-icon-theme = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "material-icon-theme";
    publisher = "pkief";
    version = "4.4.0";
    sha256 = "1m9mis59j9xnf1zvh67p5rhayaa9qxjiw9iw847nyl9vsy73w8ya";
  };

  zhuangtongfa.material-theme = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "material-theme";
    publisher = "zhuangtongfa";
    version = "3.9.3";
    sha256 = "09k1x3k12wsc80gjw0vn0d3nkhqhjwbyf4z56kb2fsd490hyhl5s";
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
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "files.watcherExclude" = {
        "**/.ammonite" = true;
        "**/.bloop" = true;
        "**/.metals" = true;
        "**/target" = true;
      };
      "liveshare.anonymousGuestApproval" = "accept";
      "metals.bloopSbtAlreadyInstalled" = true;
      "metals.serverVersion" = "0.9.4";
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
      scalameta.metals
      ms-vsliveshare.vsliveshare
      vscoss.vscode-ansible
      redhat.vscode-yaml
      rubymaniac.vscode-direnv
      pkief.material-icon-theme
      zhuangtongfa.material-theme
    ];
  };
}
