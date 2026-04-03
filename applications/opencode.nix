{ latestPkgs, ... }:
{

  programs.opencode = {
    enable = true;
    package = latestPkgs.opencode;
  };
}
