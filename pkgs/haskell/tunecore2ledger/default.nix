{ mkDerivation, base, blaze-builder, bytestring, cassava
, formatting, lens, semigroupoids, semigroups, stdenv, text, time
, vector, fetchgit, split
}:
mkDerivation rec {
  pname = "tunecore2ledger";
  version = "0.4.12";
  src = fetchgit {
    url = http://git.monster.cat/tunecore2ledger;
    rev = "dbd915c9c93076a2b2b2132af43b6c7b229a6e4a";
    sha256 = "0srm8lpxysys00f17jyds8wrfv73aav6waxy3ll2ddwk7cccx23y";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base blaze-builder bytestring cassava formatting lens semigroupoids
    semigroups text time vector split
  ];
  homepage = "monstercat.com";
  license = stdenv.lib.licenses.mit;
}
