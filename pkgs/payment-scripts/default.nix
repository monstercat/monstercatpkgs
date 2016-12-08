{ stdenv, fetchgit, postgresql, makeWrapper, buildEnv, redis, payments-processor, jq
, virtual-sheet-drive, xz, gzip
}:
let scriptEnv = buildEnv {
                  name = "import-scripts-env";
                  paths = [ redis postgresql payments-processor jq virtual-sheet-drive xz gzip ];
                };
in
stdenv.mkDerivation rec {
  name = "payment-scripts-${version}";
  version = "0.1.0";

  src = fetchgit {
    url = http://git.zero.monster.cat/payment-scripts;
    rev = "6e43b69aa31bede922e9f58da3e75aedebd6eb1c";
    sha256 = "057h9hikaaqf1xgw3x4kpkc00mjsgd581nz99snndph8h5y5r5yq";
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
    description = "Monstercat payment scripts";
    homepage = src.url;
    maintainers = with maintainers; [ jb55 ];
    license = licenses.mit;
    platforms = platforms.all;
  };
}
