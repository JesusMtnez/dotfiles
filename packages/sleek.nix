{ lib, fetchurl, appimageTools, makeWrapper, }:

let
  pname = "sleek";
  version = "2.0.20";

  src = fetchurl {
    url = "https://github.com/ransome1/sleek/releases/download/v${version}/sleek-${version}-linux-x86_64.AppImage";
    hash = "sha256-WgElz5irqtbXj/EKVnAv1qSvaUicDG1ifRziJ/Cks5Y=";
  };

  appimageContents = appimageTools.extract {
    inherit pname version src;
  };

  meta = with lib; {
    description = "todo.txt manager";
    homepage = "https://github.com/ransome1/sleek";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
in
appimageTools.wrapType2 {
  inherit pname version src meta;

  nativeBuildInputs = [ makeWrapper ];

  extraInstallCommands = ''
    wrapProgram $out/bin/sleek \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"
    mkdir -p $out/share/{applications,sleek}
    cp -a ${appimageContents}/{locales,resources} $out/share/sleek
    cp -a ${appimageContents}/usr/share/icons $out/share
    install -Dm 444 ${appimageContents}/sleek.desktop $out/share/applications
    substituteInPlace $out/share/applications/sleek.desktop --replace-warn 'Exec=AppRun' 'Exec=${pname}'
  '';
}
