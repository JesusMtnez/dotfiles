{ pkgs, ... }:
{

  programs.sbt = {
    enable = true;
    plugins = [
      {
        org = "ch.epfl.scala";
        artifact = "sbt-bloop";
        version = "1.4.11";
      }
      {
        org = "org.jmotor.sbt";
        artifact = "sbt-dependency-updates";
        version = "1.2.7";
      }
      {
        org = "io.spray";
        artifact = "sbt-revolver";
        version = "0.9.1";
      }
      {
        org = "ch.epfl.scala";
        artifact = "sbt-scalafix";
        version = "0.10.4";
      }
    ];
  };

  home.file.".sbt/1.0/credentials.sbt".text =
    ''
      credentials += Credentials(Path.userHome / ".secrets" / "credentials")
      credentials += Credentials(Path.userHome / ".secrets" / "credentials_old")
    '';
}
