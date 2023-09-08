{ lib, stdenv, jre, coursier, makeWrapper, setJavaClassPath }:

let
  baseName = "bloop";
  version = "1.5.11";
  deps = stdenv.mkDerivation {
    name = "${baseName}-deps-${version}";
    buildCommand = ''
      export COURSIER_CACHE=$(pwd)
      ${coursier}/bin/cs fetch ch.epfl.scala:bloopgun-core_2.13:${version} > deps
      mkdir -p $out/share/java
      cp $(< deps) $out/share/java/
    '';
    outputHashMode = "recursive";
    outputHash = "sha256-pRIZQesO9hT2uLXFC1PmxRI1JbmzMfFvBP5bKILfuso=";
  };
in
stdenv.mkDerivation {
  pname = baseName;
  inherit version;

  nativeBuildInputs = [ makeWrapper setJavaClassPath ];
  buildInputs = [ deps ];

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    makeWrapper ${jre}/bin/java $out/bin/${baseName} \
      --add-flags "-cp $CLASSPATH bloop.bloopgun.Bloopgun"

    runHook postInstall
  '';

  installCheckPhase = ''
    $out/bin/${baseName} --version | grep -q "${version}"
  '';

  meta = with lib; {
    description = "Opinionated code formatter for Scala";
    homepage = "http://scalameta.org/bloop";
  };
}
