{ pkgs, latestPkgs, ... }:
let

  managedExtensions = map pkgs.vscode-utils.extensionFromVscodeMarketplace (builtins.fromJSON (builtins.readFile ./managed.json));

  updateScript = pkgs.writers.writePython3Bin "code-ext-update"
    {
      libraries = [ pkgs.python3Packages.requests ];
      flakeIgnore = [ "E501" ];
    }
    (builtins.readFile ./update.py);

in
{

  programs.vscode = {
    package = latestPkgs.vscode;
    enable = true;
    # mutableExtensionsDir = false;

    userSettings = {
      "editor.fontFamily" = "'FiraCode Nerd Font'";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 12;
      "editor.fontWeight" = "normal";
      "editor.minimap" = {
        "maxColumn" = 60;
        "renderCharacters" = false;
        "size" = "fit";
      };
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
      "metals" = {
        "bloopSbtAlreadyInstalled" = true;
        "showInferredType" = true;
        "javaHome" = pkgs.jdk.home;
      };
      "oneDarkPro.vivid" = true;
      "terminal.integrated.cursorStyle" = "line";
      "terminal.integrated.fontFamily" = "'FiraCode Nerd Font'";
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

    extensions = [
      # ms-vsliveshare.vsliveshare
      latestPkgs.vscode-extensions.ms-python.python
      latestPkgs.vscode-extensions.rust-lang.rust-analyzer
    ] ++ managedExtensions;
  };

  home.packages = [
    updateScript
  ];
}
