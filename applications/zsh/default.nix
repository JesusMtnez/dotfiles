{ pkgs, lib, latestPkgs, ... }:
{

  xdg.configFile."zsh/theme.zsh".source = ./theme.zsh;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    defaultKeymap = "emacs";

    history = {
      ignoreSpace = true;
      ignoreDups = true;
      expireDuplicatesFirst = true;
      extended = true;
      save = 100000;
      size = 100000;
    };

    initContent = lib.mkMerge [
      (lib.mkBefore ''
        # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
        if [[ -r \"''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh\" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
      '')
      (lib.mkAfter ''
        # Source other resource
        [ -f $HOME/.localrc ] && source $HOME/.localrc # Local configuration

        # Act as git status if no parameters.
        g() {
          if [[ $# > 0 ]]; then
            git $@
          else
            git status -sb
          fi
        }
        compdef g=git

        # Change PWD hook
        function chpwd() {
            exa -lh # ls -lh
        }

        # Source zsh plugins managed by sheldon
        # FIXME Release 25.11 will include sheldon
        eval "$(sheldon source)"
      '')
    ];

    sessionVariables = {
      EDITOR = "${pkgs.neovim}/bin/nvim +startinsert";
      VISUAL = "${pkgs.neovim}/bin/nvim";
      ENHANCD_FILTER = "fzf";
      ENHANCD_COMPLETION_BEHAVIOR = "list";
      MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
      TERM = "xterm-256color";
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=60";
    };

    shellAliases = lib.mkMerge [
      {
        # Run as sudo
        please = "sudo -E $(fc -ln 1)";

        # Others
        grep = "grep --color=auto";
      }
      (lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        pbcopy = "${pkgs.xsel}/bin/xsel --clipboard --input";
        pbpaste = "${pkgs.xsel}/bin/xsel --clipboard --output";
        open = "xdg-open";
      })
    ];
  };

  # Release 25.11 will include sheldon: https://github.com/nix-community/home-manager/blob/master/modules/programs/sheldon.nix
  home.packages = [ pkgs.sheldon ];
  xdg.configFile."sheldon/plugins.toml".source = ./plugins.toml;

  programs.bat = {
    enable = true;
  };

  catppuccin.bat.enable = true;

  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
  };

  programs.fzf = {
    enable = true;
    package = latestPkgs.fzf;
    enableZshIntegration = true;
    enableBashIntegration = false;
  };

  catppuccin.fzf.enable = true;
}
