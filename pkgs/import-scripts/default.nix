{ stdenv, fetchgit, ledger, csv-scripts, csv-delim, report-downloader,
  postgresql, gawk, makeWrapper, buildEnv, pxz, s3cmd, glibc, tunecore2ledger }:
let scriptEnv = buildEnv {
                  name = "import-scripts-env";
                  paths = [ csv-scripts csv-delim ledger postgresql gawk
                            pxz report-downloader s3cmd glibc tunecore2ledger
                          ];
                };
in
stdenv.mkDerivation rec {
  name = "import-scripts-${version}";
  version = "0.5.3";

  src = fetchgit {
    url = http://git.zero.monster.cat/import-scripts;
    rev = "96cb4f281e0a97e2d266100f882bdbd2582b47c2";
    sha256 = "14g36q4wzgr31l4qxvpgmfh9bh5jw7n8r5mnbgrrnlmxp73aqqzi";
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
