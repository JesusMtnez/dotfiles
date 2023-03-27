{ pkgs, lib, ... }:
{
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
      EDITOR = "emacs -nw";
      VISUAL = "emacs";
      ENHANCD_FILTER = "fzf";
      ENHANCD_COMPLETION_BEHAVIOR = "list";
      MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
      PATH = "$HOME/.dotfiles/bin:$HOME/.local/bin:$PATH";
      TERM = "xterm-256color";
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=60";
    };

    initExtra = ''
      # Source other resource
      [ -f $HOME/.localrc ] && source $HOME/.localrc # Local configuration
    '';

    shellAliases = lib.mkMerge [
      {
        # Run as sudo
        please = "sudo -E $(fc -ln 1)";
        fuck = "sudo -E $(fc -ln 1)";

        # ls = if pkgs.stdenv.hostPlatform.isDarwin then "ls -G " else "ls --color=auto";
        # la = "ls -A"; # show almost all
        # l = "ls -lFh"; # long list, show type, human readable
        # ll = "ls -lAFh"; # long list, show almost all, show type, human readeable

        ls = "${pkgs.exa}/bin/exa";
        l = "${pkgs.exa}/bin/exa -l";
        la = "${pkgs.exa}/bin/exa -a";
        ll = "${pkgs.exa}/bin/exa -la";

        # Emacs
        e = "${pkgs.emacs}/bin/emacs -nw";
        emacs = "${pkgs.emacs}/bin/emacs -nw";

        # Others
        RM = "rm -rf";
        grep = "grep --color=auto";
      }
      (lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        pbcopy = "${pkgs.xsel}/bin/xsel --clipboard --input";
        pbpaste = "${pkgs.xsel}/bin/xsel --clipboard --output";
        open = "xdg-open";
      })
    ];
    # };

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
          name = "\$HOME/.config/zsh";
          tags = [ "from:local" ];
        }
      ];
    };
  };

  xdg.configFile."zsh" = {
    recursive = true;
    source = ./config;
  };

  home.file.".local/bin" = {
    recursive = true;
    source = ./bin;
  };

}
