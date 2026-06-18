{ pkgs, ... }:
{

  programs.sbt = {
    enable = true;
    package = pkgs.emptyDirectory;
    plugins = [
      {
        org = "ch.epfl.scala";
        artifact = "sbt-bloop";
        version = "2.1.0";
      }
      {
        org = "io.spray";
        artifact = "sbt-revolver";
        version = "0.10.0";
      }
    ];
  };
}
