{ pkgs, latestPkgs, ... }:
{

  programs.vscode = {
    package = latestPkgs.vscodium;
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
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = { "command" = [ "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" ]; };
        };
      };
      "terminal.integrated.cursorStyle" = "line";
      "terminal.integrated.fontFamily" = "'IosevkaTerm Nerd Font'";
      "terminal.integrated.fontSize" = 12;
      "update.mode" = "none";
      "window.restoreFullscreen" = true;
      "window.zoomLevel" = 0;
      "workbench.colorTheme" = "Catppuccin Frappé";
      "workbench.iconTheme" = "catppuccin-frappe";
      "workbench.sideBar.location" = "right";
      "redhat.telemetry.enabled" = false;

      "[nix]"."editor.tabSize" = 2;
      "[python]"."editor.tabSize" = 4;
      "[scala]"."editor.tabSize" = 2;
    };

    extensions = with pkgs.vscode-marketplace; [
      cab404.vscode-direnv
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      flix.flix
      github.vscode-github-actions
      golang.go
      jnoortheen.nix-ide
      ms-python.python
      ms-vsliveshare.vsliveshare
      redhat.ansible
      redhat.vscode-yaml
      rust-lang.rust-analyzer
      scala-lang.scala
      scalameta.metals
      task.vscode-task
      yzhang.markdown-all-in-one
    ];
  };
}
