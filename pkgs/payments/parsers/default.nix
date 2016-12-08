{ nodejs, fetchgit, payments-processor, stdenv }:

stdenv.mkDerivation {
  name = "payments-parsers";
  version = "0.1.0";

  buildInputs = [ ];

  phases = [ "unpackPhase" "installPhase" ];

  src = payments-processor.src;

  installPhase = ''
    mkdir -p $out/share
    cp -r parsers $out/share
  '';
}
