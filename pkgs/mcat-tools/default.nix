{ stdenv, fetchgit, makeWrapper, buildEnv, awscli, jq, curl }:
let scriptEnv = buildEnv {
                  name = "import-scripts-env";
                  paths = [ awscli jq curl ];
                };
in
stdenv.mkDerivation rec {
  name = "mcat-tools-${version}";
  version = "0.1.0";

  src = fetchgit {
    url = http://git.monster.cat/mcat-tools;
    rev = "bef1de529cbcd7b46398c0169cb1768e30434c87";
    sha256 = "14widfrbmkhfiscybhisaw20d6bnr9rjk9c6hbbwba427vkjmzmg";
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
    description = "Monstercat scripts";
    homepage = src.url;
    maintainers = with maintainers; [ jb55 ];
    license = licenses.mit;
    platforms = platforms.all;
  };
}
