{ stdenv, fetchgit, ledger, csv-scripts, csv-delim, report-downloader,
  postgresql, gawk, makeWrapper, buildEnv }:
let scriptEnv = buildEnv {
                  name = "import-scripts-env";
                  paths = [ csv-scripts csv-delim ledger postgresql gawk report-downloader ];
                };
in
stdenv.mkDerivation rec {
  name = "import-scripts-${version}";
  version = "0.4";

  src = fetchgit {
    url = http://git.zero.monster.cat/import-scripts;
    rev = "b5f5ba72aa2b968ec82776c96245a5380ade96b8";
    sha256 = "1cymc5n8akjvfhdlr2j2jp8hd4y3vmw0jc8zz7rifh79h91nwlfk";
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
