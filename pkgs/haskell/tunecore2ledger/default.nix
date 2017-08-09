{ mkDerivation, base, blaze-builder, bytestring, cassava
, formatting, lens, semigroupoids, semigroups, stdenv, text, time
, vector, fetchgit, split
}:
mkDerivation rec {
  pname = "tunecore2ledger";
  version = "0.4.13";
  src = fetchgit {
    url = http://git.monster.cat/tunecore2ledger;
    rev = "4845dee0e44277d4ee564f349216fe8491cad541";
    sha256 = "0jwmhkd6gfyw9jzs38g4g9h1hr5bc773fm3krrb3l5s3qbbfalqz";
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
