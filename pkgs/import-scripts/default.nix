{ stdenv, fetchgit, ledger, csv-scripts, csv-delim, report-downloader,
  postgresql, gawk, makeWrapper, buildEnv }:
let scriptEnv = buildEnv {
                  name = "import-scripts-env";
                  paths = [ csv-scripts csv-delim ledger postgresql gawk report-downloader ];
                };
in
stdenv.mkDerivation rec {
  name = "import-scripts-${version}";
  version = "0.3.1";

  src = fetchgit {
    url = http://git.zero.monster.cat/import-scripts;
    rev = "c3c4fb1adc76fab429d0668cc0fe88d9e8b603a0";
    sha256 = "0vv84x11lw3jxq4hqr0n97bfhka4avhvabzqjl4jc3fpnljqv56z";
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
