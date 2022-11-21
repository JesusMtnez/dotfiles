{ unstable, ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
  };

  # TODO bin/git-fshow
}
