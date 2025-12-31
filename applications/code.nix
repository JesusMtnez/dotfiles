{ pkgs, latestPkgs, ... }:
{
  catppuccin = {
    vscode.profiles.default = {
      enable = true;
      icons.enable = true;
    };
  };

  programs.vscode = {
    package = latestPkgs.vscode;
    enable = true;
    mutableExtensionsDir = false;

    profiles.default = {
      userSettings = {
        "editor.fontFamily" = "'IosevkaTerm Nerd Font'";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 13;
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
        "metals.bloopSbtAlreadyInstalled" = true;
        "metals.enableIndentOnPaste" = true;
        "metals.suggestLatestUpgrade" = "off";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "${pkgs.nil}/bin/nil";
        "terminal.integrated.cursorStyle" = "line";
        "terminal.integrated.fontFamily" = "'IosevkaTerm Nerd Font'";
        "terminal.integrated.fontSize" = 13;
        "update.mode" = "none";
        "window.restoreFullscreen" = true;
        "window.zoomLevel" = 0;
        "workbench.sideBar.location" = "right";
        "redhat.telemetry.enabled" = false;

        "[go]"."editor.tabSize" = 2;
        "[nix]"."editor.tabSize" = 2;
        "[python]"."editor.tabSize" = 4;
        "[scala]"."editor.tabSize" = 2;
      };

      extensions = with pkgs.vscode-marketplace; [
        # Tools
        cab404.vscode-direnv
        github.vscode-github-actions
        mechatroner.rainbow-csv
        ms-vsliveshare.vsliveshare
        task.vscode-task

        # Languagues
        jnoortheen.nix-ide
        # flix.flix
        golang.go
        casualjim.gotemplate
        ms-python.python
        redhat.ansible
        redhat.vscode-yaml
        # rust-lang.rust-analyzer
        scala-lang.scala
        scalameta.metals
        yzhang.markdown-all-in-one
      ];
    };
  };
}
