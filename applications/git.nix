{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    settings = {
      user.name = "JesusMtnez";
      user.email = "jesusmartinez93@gmail.com";

      signing = {
        signByDefault = true;
        key = "D54244C88732F2A1";
      };

      core = {
        editor = "${pkgs.neovim}/bin/nvim +startinsert!";
        autocrlf = "input";
        whitespace = "trailing-space,blank-at-eol,tabs-in-indent";
      };

      pull.ff = "only";

      push = {
        default = "simple";
        autoSetupRemote = true;
      };

      fetch.prune = "true";

      color.ui = "auto";

      alias = {
        s = "status";
        sa = "status --ignored";
        co = "checkout";
        a = "add";
        aa = "add --all";
        ap = "add --patch";
        c = "commit --verbose";
        ca = "commit --all";
        cm = "commit --message";
        cma = "commit --all --message";
        cam = "commit --amend";
        camn = "commit --amend --no-edit";
        ps = "push";
        psf = "push --force-with-lease";
        pl = "pull";
        plp = "pull --prune";
        plr = "pull --rebase";
        cl = "clone";
        clr = "clone --recursive";
        ra = "remote add";
        rr = "remote rm";
        rp = "remote prune";
        rpo = "remote prune origin";
        b = "branch";
        br = "branch --remotes";
        ba = "branch --all";
        bu = "branch -u";
        l = "log -2";
        t = "log --graph --pretty=format:'%C(yellow)%h%Creset%C(auto)%d%Creset %s %Cblue<%an>%Creset %Cgreen(%cr)%Creset' --abbrev-commit --all";
        d = "diff";
        dc = "diff --cached";
        df = "!f() { git --no-pager diff $@; }; f";
        dfc = "!f() { git --no-pager diff --cached $@; }; f";
        f = "fetch";
        fa = "fetch --all";
        m = "merge";
        su = "submodule foreach git pull origin master";
        patch = "!git --no-pager diff --no-color";
      };
    };

    includes = [
      {
        path = "~/workspaces/.gitconfig";
        condition = "gitdir:~/workspaces/";
      }
    ];

    ignores = [
      # Mac OSX
      ".DS_Store"

      # Metals
      ".metals/"
      ".bloop/"
      "project/metals.sbt"
      ".bsp/"

      # Editors
      ".idea/"
      ".vscode/"
    ];
  };

  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
  };

  home.packages = with pkgs; [
    gh
    tea
  ];
}
