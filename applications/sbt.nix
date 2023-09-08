{ pkgs, lib, isWorkstation, ... }:
{

  programs.sbt = {
    enable = true;
    plugins = [
      {
        org = "ch.epfl.scala";
        artifact = "sbt-bloop";
        version = "1.5.11";
      }
      {
        org = "io.spray";
        artifact = "sbt-revolver";
        version = "0.10.0";
      }
      {
        org = "ch.epfl.scala";
        artifact = "sbt-scalafix";
        version = "0.11.0";
      }
    ];
  };

  home.file.".sbt/1.0/credentials.sbt" = lib.mkIf isWorkstation {
    text =
      ''
        credentials += Credentials(Path.userHome / ".secrets" / "credentials")
        credentials += Credentials(Path.userHome / ".secrets" / "credentials_old")
      '';
  };
}
