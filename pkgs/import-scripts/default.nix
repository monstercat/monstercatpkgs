{ stdenv, fetchgit, ledger, csv-scripts, csv-delim, report-downloader,
  postgresql, gawk, makeWrapper, buildEnv }:
let scriptEnv = buildEnv {
                  name = "import-scripts-env";
                  paths = [ csv-scripts csv-delim ledger postgresql gawk report-downloader ];
                };
in
stdenv.mkDerivation rec {
  name = "import-scripts-${version}";
  version = "0.2";

  src = fetchgit {
    url = http://git.zero.monster.cat/import-scripts;
    rev = "4a0cbe5861df792eaab6894dbc30163a1148d8c4";
    sha256 = "06zs10q727g9vfg1s1b6l87lfmvsz6a9hl6q9kbpx7n710fzlddk";
  };

  buildInputs = [ makeWrapper ];

  makeFlags = "PREFIX=$(out)";

  installPhase = ''
    for bin in "$out"/bin/{tunecore-transaction,trend,sales}-bot; do
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
