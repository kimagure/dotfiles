let
  pkgs = import <nixpkgs> {};
in pkgs.stdenv.mkDerivation {
  name = "firefox-simple";
  src = pkgs.fetchurl {
    url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/64.0/linux-x86_64/en-US/firefox-64.0.tar.bz2";
    sha256 = "0pvm06v7dlzwb2z2cdsd44bg0aikn8x1q0ml8nb0ad8pakbnk8c1";
  };
  phases = "unpackPhase installPhase";
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/firefox
    ${pkgs.gnutar}/bin/tar xf $src --strip 1 -C $out/firefox
    ln -s $out/firefox/firefox $out/bin/firefox
  '';
}