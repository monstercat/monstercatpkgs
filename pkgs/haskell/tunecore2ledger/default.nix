{ mkDerivation, base, blaze-builder, bytestring, cassava
, formatting, lens, semigroupoids, semigroups, stdenv, text, time
, vector, fetchgit
}:
mkDerivation {
  pname = "tunecore2ledger";
  version = "0.1.0.0";
  src = fetchgit {
    url = http://git.zero.monster.cat/tunecore2ledger;
    rev = "13e74d17a15fa5b5d8d14f5d67c04b1575e128f0";
    sha256 = "1bfayd51120hh0pjiqzc8n5ca2xl658b7k6lm12h6rxz4xis3dh8";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base blaze-builder bytestring cassava formatting lens semigroupoids
    semigroups text time vector
  ];
  homepage = "monstercat.com";
  license = stdenv.lib.licenses.mit;
}
