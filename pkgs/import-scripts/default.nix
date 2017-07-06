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
  version = "0.5.1";

  src = fetchgit {
    url = http://git.zero.monster.cat/import-scripts;
    rev = "5567e9ce414ae8d73bb481bc4d222b5a595facc4";
    sha256 = "0am9xdi9pynigy9034xfz38gh7y37id6yf7sz81z4kcyfyq3md2j";
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
