{ lib, fetchurl, appimageTools, }:

let
  pname = "sleek";
  version = "2.0.11";

  src = fetchurl {
    url = "https://github.com/ransome1/sleek/releases/download/v${version}/sleek-${version}.AppImage";
    hash = "sha256-Iom2idwdcOgahopiXRvhw+xZVe2cXVfBg8pmWLg/sIc=";
  };

  appimageContents = appimageTools.extract {
    inherit pname version src;
  };
in
appimageTools.wrapType2 rec {
  inherit pname version src;

  profile = ''
    export LC_ALL=C.UTF-8
  '';

  multiPkgs = null; # no 32bit needed

  extraPkgs = pkgs: (appimageTools.defaultFhsEnvArgs.multiPkgs pkgs)
    ++ [ pkgs.libappindicator ];

  extraInstallCommands = ''
    # Strip version from binary name.
    mv $out/bin/${pname}-${version} $out/bin/${pname}

    install -m 444 \
        -D ${appimageContents}/sleek.desktop \
        -t $out/share/applications

    substituteInPlace \
        $out/share/applications/sleek.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'

    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = with lib; {
    description = "todo.txt manager";
    homepage = "https://github.com/ransome1/sleek/wiki";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
}
