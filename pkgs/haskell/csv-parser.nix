{ mkDerivation, base, csv, data-default, MissingH, mtl, safe
, stdenv, transformers, unordered-containers, fetchzip
}:
mkDerivation rec {
  pname = "csv-parser";
  version = "0.3.0";
  src = fetchzip {
    name = "${pname}-${version}";
    url = "https://github.com/jb55/csv-parser/archive/${version}.tar.gz";
    sha256 = "0bl4v8rm19x8m6f88khjhl6wchr8x9vi9dxgqsrq4r661xlpqaii";
  };
  buildDepends = [
    base csv data-default MissingH mtl safe transformers
    unordered-containers
  ];
  license = stdenv.lib.licenses.bsd3;
}
