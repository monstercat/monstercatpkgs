{ nodejs, fetchgit, stdenv }:

stdenv.mkDerivation {
  name = "payments-client";
  version = "0.0.1";

  buildInputs = [ nodejs ];

  src = fetchgit {
    url = http://git.zero.monster.cat/payments-client;
    rev = "073133609a1797af3f3655b25e104fe949b255b1";
    sha256 = "1sfvpzz02irv30dv05xfnghk9hm4v61byqkr6fnb62sx4chqay25";
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
