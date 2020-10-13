{ pkgs, ... }:
{
  home.packages = [ pkgs.tilix ];

  xdg.configFile."tilix/schemes/one-dark.json".text = builtins.readFile (
    pkgs.fetchFromGitHub {
      owner = "storm119";
      repo = "Tilix-Themes";
      rev = "4ff0a8a866a1cf5bd04c62fec624ec9feefa1d4e";
      sha256 = "1js5857rzrsw2qir9br0i798wx8pd1h3zfswg31yads8ka3xk0bf";
    } + "/Themes/one-dark.json"
  );
}
