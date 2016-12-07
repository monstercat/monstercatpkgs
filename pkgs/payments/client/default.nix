{ nodejs, fetchgit, stdenv }:

stdenv.mkDerivation {
  name = "payments-client";
  version = "0.0.1";

  buildInputs = [ nodejs ];

  src = fetchgit {
    url = http://git.zero.monster.cat/payments-client;
    rev = "79eec2f4557128fd1e521865a79236bcd3fe124b";
    sha256 = "1yiawcin9bn4pylna8m0pqqfkfflsfiksbnjchyb6225y5s3s314";
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
