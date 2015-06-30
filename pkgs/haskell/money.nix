{ mkDerivation, base, data-default, Decimal, stdenv, fetchzip }:
mkDerivation rec {
  pname = "money";
  version = "1.0.0";
  src = fetchzip {
    name = "${pname}-${version}";
    url = "https://github.com/jb55/money/archive/${version}.tar.gz";
    sha256 = "0q280njcbmblrzv5qjmkn9hfpb8m2dpahkza55bqlj7y9akimdrd";
  };
  buildDepends = [ base data-default Decimal ];
  homepage = "https://github.com/jb55/money";
  description = "Money type";
  license = stdenv.lib.licenses.bsd3;
}
