{ stdenv, fetchgit, ledger, csv-scripts, csv-delim, report-downloader,
  postgresql, gawk, makeWrapper, buildEnv, pxz, s3cmd, glibc }:
let scriptEnv = buildEnv {
                  name = "import-scripts-env";
                  paths = [ csv-scripts csv-delim ledger postgresql gawk
                            pxz report-downloader s3cmd glibc
                          ];
                };
in
stdenv.mkDerivation rec {
  name = "import-scripts-${version}";
  version = "0.4.9";

  src = fetchgit {
    url = http://git.zero.monster.cat/import-scripts;
    rev = "19e152fafad1514847fa0fd4ef5698472b9d8840";
    sha256 = "0sqv9y8ma4jiic07dvb61js25l9ms11waqy5alv6nzkmi8l5kpph";
  };

  buildInputs = [ makeWrapper ];

  makeFlags = "PREFIX=$(out)";

  installPhase = ''
    for bin in "$out"/bin/*; do
      wrapProgram "$bin" \
        --prefix "PATH" : "$out/bin:${scriptEnv}/bin"
    done
  '';

  meta = with stdenv.lib; {
    description = "Monstercat import scripts";
    homepage = src.url;
    maintainers = with maintainers; [ jb55 ];
    license = licenses.mit;
    platforms = platforms.all;
  };
}
