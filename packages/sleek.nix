{ lib, fetchurl, appimageTools, }:

let
  pname = "sleek";
  version = "2.0.18";

  src = fetchurl {
    url = "https://github.com/ransome1/sleek/releases/download/v${version}/sleek-${version}-linux-x86_64.AppImage";
    hash = "sha256-t7efmLCNzg3wYWDKNCASzHXyBPgaMnwPAMXpu0zjKDc=";
  };

  appimageContents = appimageTools.extract {
    inherit pname version src;
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  profile = ''
    export LC_ALL=C.UTF-8
  '';

  multiPkgs = null; # no 32bit needed

  extraPkgs = pkgs: (appimageTools.defaultFhsEnvArgs.multiPkgs pkgs)
    ++ [ pkgs.libappindicator ];

  extraInstallCommands = ''
    # Strip version from binary name.
    # mv $out/bin/${pname}-${version} $out/bin/${pname}

    install -m 444 \
        -D ${appimageContents}/sleek.desktop \
        $out/share/applications/sleek.desktop

    substituteInPlace \
        $out/share/applications/sleek.desktop \
        --replace-fail 'Exec=AppRun' 'Exec=${pname}'

    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = with lib; {
    description = "todo.txt manager";
    homepage = "https://github.com/ransome1/sleek/wiki";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
}
