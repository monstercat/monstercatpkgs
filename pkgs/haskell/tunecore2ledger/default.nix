{ mkDerivation, base, blaze-builder, bytestring, cassava
, formatting, lens, semigroupoids, semigroups, stdenv, text, time
, vector, fetchgit
}:
mkDerivation {
  pname = "tunecore2ledger";
  version = "0.1.0.0";
  src = fetchgit {
    url = http://git.zero.monster.cat/tunecore2ledger;
    rev = "c5432c88984839a04eed6332a49d2f6f8771e61b";
    sha256 = "0b7hlm51wajk8hxj3xb66cd73m9y90bgzwk0xdgwzzzcxhkc73xm";
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
