{ stdenv, fetchFromGitHub }:
stdenv.mkDerivation rec {
  name = "csv-delim-${version}";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "jb55";
    repo = "csv-delim";
    rev = "6f729928c76d38b6f45d3d7d25d5196450f1a9c5";
    sha256 = "0a0nli8frrzkw0nyw9hs3f1i2gyhwg1v4frgfn6sqcbcgfdkrgxq";
  };

  makeFlags = "PREFIX=$(out)";

  preInstall = ''
    mkdir -p "$out/bin"
  '';

  meta = with stdenv.lib; {
    description = "csv deliminator";
    homepage = https://github.com/jb55/csv-delim;
    maintainers = with maintainers; [ jb55 ];
    license = licenses.mit;
    platforms = platforms.all;
  };
}
