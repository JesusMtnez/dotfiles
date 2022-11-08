{ unstable, ... }:
{
  programs.fzf = {
    enable = true;
    package = unstable.fzf;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
  };

  # TODO bin/git-fshow
}
