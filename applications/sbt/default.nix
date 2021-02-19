{ pkgs, ... }:
{

  home.packages = [
    (pkgs.sbt.override { jre = pkgs.jdk11_headless; })
  ];

  home.file.".sbt/1.0/plugins/globalPlugins.sbt".text = ''
    addSbtPlugin("ch.epfl.scala"    % "sbt-bloop"                 % "1.4.8")
    //addSbtPlugin("net.virtual-void" % "sbt-dependency-graph"      % "0.10.0-RC1")
    addSbtPlugin("org.jmotor.sbt"   % "sbt-dependency-updates"    % "1.2.2")
    addSbtPlugin("com.github.cb372" % "sbt-explicit-dependencies" % "0.2.16")
    addSbtPlugin("io.spray"         % "sbt-revolver"              % "0.9.1")
    addSbtPlugin("ch.epfl.scala"    % "sbt-scalafix"              % "0.9.25")
  '';

  home.file.".sbt/1.0/global.sbt".text = ''
    credentials += Credentials(Path.userHome / ".sbt" / ".credentials")
  '';
}
