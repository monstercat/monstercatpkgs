{ mkDerivation, base, stdenv, fetchzip }:
mkDerivation rec {
  pname = "flexible";
  version = "0.1.0.0";
  src = fetchzip {
    name = "${pname}-${version}.tar.gz";
    url = "https://github.com/jb55/flexible/archive/${version}.tar.gz";
    sha256 = "05x8rjikvjjjy1sckn1hh06i3jfr8x3r0fjn5lz2n69h4v469vdp";
  };
  buildDepends = [ base ];
  description = "Flexible data type for dealing with unexpected data";
  license = stdenv.lib.licenses.mit;
}
