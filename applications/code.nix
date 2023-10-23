{ pkgs, latestPkgs, ... }:
{

  programs.vscode = {
    package = latestPkgs.vscode;
    enable = true;
    mutableExtensionsDir = false;

    userSettings = {
      "editor.fontFamily" = "'IosevkaTerm Nerd Font'";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 12;
      "editor.fontWeight" = "normal";
      "editor.minimap.maxColumn" = 60;
      "editor.minimap.renderCharacters" = false;
      "editor.minimap.size" = "fit";
      "editor.renderWhitespace" = "all";
      "editor.tabSize" = 2;
      "editor.wordWrapColumn" = 100;
      "editor.bracketPairColorization.enabled" = true;
      "explorer.confirmDelete" = false;
      "extensions.autoCheckUpdates" = false;
      "extensions.autoUpdate" = false;
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
      "metals.suggestLatestUpgrade" = false;
      "metals.showInferredType" = true;
      "metals.bloopSbtAlreadyInstalled" = true;
      "nix.enableLanguageServer" = true;
      "nix.formatterPath" = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
      "nix.serverPath" = "${pkgs.rnix-lsp}/bin/rnix-lsp";
      "oneDarkPro.vivid" = true;
      "terminal.integrated.cursorStyle" = "line";
      "terminal.integrated.fontFamily" = "'IosevkaTerm Nerd Font'";
      "terminal.integrated.fontSize" = 12;
      "update.mode" = "none";
      "window.restoreFullscreen" = true;
      "window.zoomLevel" = 0;
      "workbench.colorTheme" = "One Dark Pro";
      "workbench.iconTheme" = "material-icon-theme";
      "redhat.telemetry.enabled" = false;

      "[nix]"."editor.tabSize" = 2;
      "[python]"."editor.tabSize" = 4;
      "[scala]"."editor.tabSize" = 2;
    };

    extensions = with pkgs.vscode-marketplace; [
      cab404.vscode-direnv
      pkgs.vscode-marketplace-release.eamodio.gitlens
      flix.flix
      github.vscode-github-actions
      jnoortheen.nix-ide
      pkgs.open-vsx.ms-python.python
      ms-vsliveshare.vsliveshare
      pkief.material-icon-theme
      redhat.ansible
      redhat.vscode-yaml
      pkgs.vscode-marketplace-release.rust-lang.rust-analyzer
      scala-lang.scala
      scalameta.metals
      vscodevim.vim
      zhuangtongfa.material-theme
    ];
  };
}
