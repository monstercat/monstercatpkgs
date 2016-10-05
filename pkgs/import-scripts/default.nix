{ stdenv, fetchgit, ledger, csv-scripts, csv-delim, report-downloader,
  postgresql, gawk, makeWrapper, buildEnv, pxz, s3cmd }:
let scriptEnv = buildEnv {
                  name = "import-scripts-env";
                  paths = [ csv-scripts csv-delim ledger postgresql gawk
                            pxz report-downloader s3cmd
                          ];
                };
in
stdenv.mkDerivation rec {
  name = "import-scripts-${version}";
  version = "0.4.1";

  src = fetchgit {
    url = http://git.zero.monster.cat/import-scripts;
    rev = "59d9abef852b697e52b188f9539fe51d11ca9fc7";
    sha256 = "1ypfwmc8fdprs8k8lyqgi8ivfrmzgwcpr6769am45g8wd121645k";
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
