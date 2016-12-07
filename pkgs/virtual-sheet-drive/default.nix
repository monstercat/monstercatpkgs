{ stdenv, fetchgit, postgresql, makeWrapper, buildEnv, awscli }:
let scriptEnv = buildEnv {
                  name = "import-scripts-env";
                  paths = [ postgresql awscli
                          ];
                };
in
stdenv.mkDerivation rec {
  name = "virutal-sheet-drive-${version}";
  version = "0.1.0";

  src = fetchgit {
    url = http://git.zero.monster.cat/virtual-sheet-drive;
    rev = "40dbd6fd3373753856a66a101db3256f0edef2c2";
    sha256 = "085isg910cl8cfc9i1iw1qb7f2dfkgabjc4f9hb1qhs2cn1y29rb";
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
    description = "Virtual sheet drive for payment sheets";
    homepage = src.url;
    maintainers = with maintainers; [ jb55 ];
    license = licenses.mit;
    platforms = platforms.all;
  };
}
