{ pkgs, lib, ... }:
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

    initExtraFirst = ''
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      if [[ -r \"''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh\" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';

    sessionVariables = {
      EDITOR = "${pkgs.neovim}/bin/nvim +startinsert";
      VISUAL = "${pkgs.neovim}/bin/nvim";
      ENHANCD_FILTER = "fzf";
      ENHANCD_COMPLETION_BEHAVIOR = "list";
      MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
      TERM = "xterm-256color";
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=60";
    };

    initExtra = ''
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
    '';

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

    zplug = {
      enable = true;
      plugins = [
        {
          name = "zplug/zplug";
          tags = [ "hook-build:'zplug --self-managed'" ];
        }
        {
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1" ];
        }
        {
          name = "lib/completion";
          tags = [ "from:oh-my-zsh" "depth:1" ];
        }
        {
          name = "lib/history";
          tags = [ "from:oh-my-zsh" "depth:1" ];
        }
        {
          name = "lib/key-bindings";
          tags = [ "from:oh-my-zsh" "depth:1" ];
        }
        {
          name = "junegunn/fzf";
          tags = [ "use:\"shell/*.zsh\"" "depth:1" "defer:3" ];
        }
        {
          name = "zsh-users/zsh-autosuggestions";
          tags = [ "depth:1" ];
        }
        {
          name = "zsh-users/zsh-completions";
          tags = [ "depth:1" ];
        }
        {
          name = "b4b4r07/enhancd";
          tags = [ "use:init.sh" "depth:1" ];
        }
        {
          name = "zdharma-continuum/fast-syntax-highlighting";
          tags = [ "depth:1" "defer:2" ];
        }
        {
          name = "hlissner/zsh-autopair";
          tags = [ "depth:1" "defer:2" ];
        }
        {
          name = "plugins/kubectl";
          tags = [ "from:oh-my-zsh" "as:plugin" "depth:1" "defer:2" ];
        }
        {
          name = "plugins/docker";
          tags = [ "from:oh-my-zsh" "as:plugin" "depth:1" "defer:2" ];
        }
        {
          name = "plugins/vscode";
          tags = [ "from:oh-my-zsh" "as:plugin" "depth:1" "defer:2" ];
        }
        {
          name = "go-task/task";
          tags = [ "depth:1" "use:completion/zsh" ];
        }
        {
          name = "\$HOME/.config/zsh";
          tags = [ "from:local" ];
        }
      ];
    };
  };

  programs.bat = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
  };

  programs.fzf = {
    enable = true;
    catppuccin.enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
  };
}
