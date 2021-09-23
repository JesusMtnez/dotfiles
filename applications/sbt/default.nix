{ pkgs, ... }:
{

  programs.sbt = {
    enable = true;
    package = (pkgs.sbt.override { jre = pkgs.graalvm11-ce; });
    plugins = [
      {
        org = "ch.epfl.scala";
        artifact = "sbt-bloop";
        version = "1.4.9";
      }
      {
        org = "org.jmotor.sbt";
        artifact = "sbt-dependency-updates";
        version = "1.2.2";
      }
      {
        org = "com.github.cb372";
        artifact = "sbt-explicit-dependencies";
        version = "0.2.16";
      }
      {
        org = "io.spray";
        artifact = "sbt-revolver";
        version = "0.9.1";
      }
      {
        org = "ch.epfl.scala";
        artifact = "sbt-scalafix";
        version = "0.9.31";
      }
    ];
  };
}
