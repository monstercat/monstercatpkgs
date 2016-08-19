{ mkDerivation, aeson, base, data-default, flexible, mtl
, persistent, stdenv, text, fetchFromGitHub, postgresql-simple, bytestring
}:
mkDerivation rec {
  pname = "flexible-instances";
  version = "0.4.0";
  src = fetchFromGitHub {
    repo = "${pname}";
    owner = "jb55";
    sha256 = "0b5fnl4sx18s8yf5pc8lampl3rmf4s57zkzrjglbvhanhhl3zs0p";
    rev = version;
  };
  buildDepends = [
    aeson base data-default flexible mtl persistent text postgresql-simple
    bytestring
  ];
  description = "Helpful instances for Data.Flexible";
  license = stdenv.lib.licenses.mit;
}
