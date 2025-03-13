{ ... }:
{

  programs.sbt = {
    enable = true;
    plugins = [
      {
        org = "ch.epfl.scala";
        artifact = "sbt-bloop";
        version = "1.5.15";
      }
      {
        org = "io.spray";
        artifact = "sbt-revolver";
        version = "0.10.0";
      }
      {
        org = "ch.epfl.scala";
        artifact = "sbt-scalafix";
        version = "0.14.2";
      }
    ];
  };
}
