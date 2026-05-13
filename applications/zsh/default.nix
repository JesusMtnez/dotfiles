{
  pkgs,
  lib,
  latestPkgs,
  ...
}:
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

        # Source mise
        if command -v mise &> /dev/null; then
          eval "$(mise activate zsh)"
        fi
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

  programs.sheldon = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      shell = "zsh";

      plugins = {
        zsh-defer = {
          github = "romkatv/zsh-defer";
        };

        powerlevel10k = {
          github = "romkatv/powerlevel10k";
        };

        ohmyzsh = {
          github = "ohmyzsh/ohmyzsh";
          use = [
            "lib/completion.zsh"
            "lib/history.zsh"
            "lib/key-bindings.zsh"
            "plugins/kubectl.plugin.zsh"
            "plugins/docker.plugin.zsh"
            "plugins/vscode.plugin.zsh"
          ];
        };

        fzf = {
          github = "junegunn/fzf";
          use = [
            "shell/completion.zsh"
            "shell/key-bindings.zsh"
          ];
        };

        zsh-autosuggestions = {
          github = "zsh-users/zsh-autosuggestions";
          use = [ "zsh-autosuggestions.zsh" ];
        };

        zsh-completions = {
          github = "zsh-users/zsh-completions";
          use = [ "zsh-completions.plugin.zsh" ];
        };

        enhancd = {
          github = "b4b4r07/enhancd";
          use = [ "init.sh" ];
        };

        fast-syntax-highlighting = {
          github = "zdharma-continuum/fast-syntax-highlighting";
          use = [ "fast-syntax-highlighting.plugin.zsh" ];
        };

        zsh-autopair = {
          github = "hlissner/zsh-autopair";
          use = [ "zsh-autopair.plugin.zsh" ];
        };

        go-tasks = {
          github = "go-task/task";
          use = [ "completion/zsh/_task" ];
        };

        local = {
          local = "/home/jesus/.config/zsh";
        };
      };

      templates = {
        defer = "{{ hooks?.pre | nl }}{% for file in files %}zsh-defer source \"{{ file }}\"\n{% endfor %}{{ hooks?.post | nl }}";
      };
    };
  };

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
