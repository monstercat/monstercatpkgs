{ nodejs, fetchgit, stdenv }:

stdenv.mkDerivation {
  name = "payments-client";
  version = "0.0.1";

  buildInputs = [ nodejs ];

  src = fetchgit {
    url = http://git.zero.monster.cat/payments-client;
    rev = "f5923c5eebde477724c3f331401608643014281c";
    sha256 = "1a3zfyjm8pzy8jmrhf3jpxfy7g8aixa23hgb1wb9pi0rxswp688c";
  };

  buildPhase = ''
    export PUBLIC_DIR=$PWD/src
    node index.js build > index.html
  '';

  installPhase = ''
    mkdir -p $out/share
    cp index.html $out/share
    cp -r src/* $out/share
  '';
}
