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
  version = "0.4.6";

  src = fetchgit {
    url = http://git.zero.monster.cat/import-scripts;
    rev = "2fce3c823b301dead097e7c7a6ab35e6d204d701";
    sha256 = "1h7f0gdd8n634q2qrarayrrapa093wmms7mycs506985hpnjjx7z";
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
