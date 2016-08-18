{ mkDerivation, aeson, base, data-default, flexible, mtl
, persistent, stdenv, text, fetchFromGitHub, postgresql-simple, bytestring
}:
mkDerivation rec {
  pname = "flexible-instances";
  version = "0.3.0";
  src = fetchFromGitHub {
    repo = "${pname}";
    owner = "jb55";
    sha256 = "1yffdlyhn7y2637r4j78niplz9b6rydf3y12hgzk6a98ap9fiqy7";
    rev = version;
  };
  buildDepends = [
    aeson base data-default flexible mtl persistent text postgresql-simple
    bytestring
  ];
  description = "Helpful instances for Data.Flexible";
  license = stdenv.lib.licenses.mit;
}
