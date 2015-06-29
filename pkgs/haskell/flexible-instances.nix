{ mkDerivation, aeson, base, data-default, flexible, mtl
, persistent, stdenv, text, fetchzip
}:
mkDerivation rec {
  pname = "flexible-instances";
  version = "0.2.0";
  src = fetchzip {
    name = "${pname}-${version}.tar.gz";
    url = "https://github.com/jb55/flexible-instances/archive/${version}.tar.gz";
    sha256 = "1fm63bys1c9cbp8lgkrlyprksfhic05fw2hq9wh0axb5ggs1jyih";
  };
  buildDepends = [
    aeson base data-default flexible mtl persistent text
  ];
  description = "Helpful instances for Data.Flexible";
  license = stdenv.lib.licenses.mit;
}
