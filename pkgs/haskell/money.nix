{ mkDerivation, base, data-default, Decimal, stdenv, fetchzip }:
mkDerivation rec {
  pname = "money";
  version = "1.0.0";
  src = fetchzip {
    name = "${pname}-${version}";
    url = "https://github.com/jb55/money/archive/${version}.tar.gz";
    sha256 = "012i13v3yvyq0x3dp766z5wm6vn3ad0fnhax03xjg9yq1xp7c2vb";
  };
  buildDepends = [ base data-default Decimal ];
  homepage = "https://github.com/jb55/money";
  description = "Money type";
  license = stdenv.lib.licenses.bsd3;
}
