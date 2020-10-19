{ ... }:
{
  home.file.".sbt/1.0/plugins/globalPlugins.sbt".text = ''
    addSbtPlugin("ch.epfl.scala"    % "sbt-bloop"                 % "1.4.4")
    addSbtPlugin("net.virtual-void" % "sbt-dependency-graph"      % "0.10.0-RC1")
    addSbtPlugin("org.jmotor.sbt"   % "sbt-dependency-updates"    % "1.2.2")
    addSbtPlugin("com.github.cb372" % "sbt-explicit-dependencies" % "0.2.13")
    addSbtPlugin("io.spray"         % "sbt-revolver"              % "0.9.1")
    addSbtPlugin("ch.epfl.scala"    % "sbt-scalafix"              % "0.9.21")
  '';
}
