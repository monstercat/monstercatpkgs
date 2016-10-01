{ stdenv, fetchgit, ledger, csv-scripts, csv-delim, report-downloader,
  postgresql, gawk, makeWrapper, buildEnv }:
let scriptEnv = buildEnv {
                  name = "import-scripts-env";
                  paths = [ csv-scripts csv-delim ledger postgresql gawk report-downloader ];
                };
in
stdenv.mkDerivation rec {
  name = "import-scripts-${version}";
  version = "0.1";

  src = fetchgit {
    url = http://git.zero.monster.cat/import-scripts;
    rev = "5208a925d6f661362f00524938f603aa6aabcdde";
    sha256 = "1x0whna1rcbja950w72wf8rgf6rzic0vnizdmhsiwnwc5i798qlk";
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
