{ nodejs, fetchgit, stdenv }:

stdenv.mkDerivation {
  name = "payments-client";
  version = "0.0.1";

  buildInputs = [ nodejs ];

  # src = fetchgit {
  #   url = http://git.monster.cat/payments-client;
  #   rev = "9febfa1652030cb76c0ed2e665f08fc5ab0267b6";
  #   sha256 = "012pkr0m8lpg1jsys1wk1vbbbjjf7xzbmdrvlc720x1l11lkay4b";
  # };
  src = /home/jb55/projects/monstercat/payments-client;

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
