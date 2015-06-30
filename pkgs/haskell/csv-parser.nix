{ mkDerivation, base, csv, data-default, MissingH, mtl, safe
, stdenv, transformers, unordered-containers, fetchzip
}:
mkDerivation rec {
  pname = "csv-parser";
  version = "0.2.2.2";
  src = fetchzip {
    name = "${pname}-${version}";
    url = "https://github.com/jb55/csv-parser/archive/${version}.tar.gz";
    sha256 = "012i13v3yvyq0x3dp766z5wm6vn3ad0fnhax03xjg9yq1xp7c2vb";
  };
  buildDepends = [
    base csv data-default MissingH mtl safe transformers
    unordered-containers
  ];
  license = stdenv.lib.licenses.bsd3;
}
