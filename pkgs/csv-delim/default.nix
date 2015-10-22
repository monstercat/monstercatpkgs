{ stdenv, fetchFromGitHub }:
stdenv.mkDerivation rec {
  name = "csv-delim-${version}";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "jb55";
    repo = "csv-delim";
    rev = "5adb97b546326b414669ae2ace6da5848215bbdb";
    sha256 = "0p3d6gyr157krynxh0gjzn11j9zq36c9i6754sj4bi0pag1w8030";
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
