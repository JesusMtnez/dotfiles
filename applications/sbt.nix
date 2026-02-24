{ pkgs, ... }:
{

  programs.sbt = {
    enable = true;
    package = pkgs.emptyDirectory;
    plugins = [
      {
        org = "ch.epfl.scala";
        artifact = "sbt-bloop";
        version = "2.0.19";
      }
      {
        org = "io.spray";
        artifact = "sbt-revolver";
        version = "0.10.0";
      }
      {
        org = "ch.epfl.scala";
        artifact = "sbt-scalafix";
        version = "0.14.5";
      }
    ];
  };
}
