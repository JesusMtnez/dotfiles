{ pkgs, ... }:
let
  rofiThemes = pkgs.fetchFromGitHub {
    owner = "davatorium";
    repo = "rofi-themes";
    rev = "e17b591590f0445fdc8ec1ff876f26d994e99bb4";
    sha256 = "1n7wb6dhcjzjy8dwpkrhwn3ckdi6m3cddmk8vphvaxn202mgpqvi";
  };
in {
  programs.rofi.enable = true;

  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  xdg.configFile."rofi/slate.rasi".text = builtins.readFile ( rofiThemes + "/User Themes/slate.rasi" );
}
