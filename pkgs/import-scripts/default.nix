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
    rev = "2166ada5bac49580ef03a2e50265443702ce30aa";
    sha256 = "12aqbn39vdcgkkdx4g7wla479q61i88x90jswh77zwnislm5mnkb";
  };

  buildInputs = [ makeWrapper ];

  makeFlags = "PREFIX=$(out)";

  installPhase = ''
    for bin in "$out"/bin/tunecore-transaction-bot; do
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
