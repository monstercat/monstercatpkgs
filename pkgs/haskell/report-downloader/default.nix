{ mkDerivation, base, bytestring, http-client
, http-client-tls, lens, stdenv, taggy-lens, text, time, wreq, fetchgit, split, http-types, HTTP
}:
mkDerivation rec {
  pname = "report-downloader";
  version = "0.2.2";
  src = fetchgit {
    url = http://git.zero.monster.cat/report-downloader;
    rev = "53ecfc15d11242b919634506ac180017ffb3697b";
    sha256 = "1x2p67qlwdpl8lnc9xmiv1yahgf5jfqzi181knmdvv2m4x7ns7gv";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring http-client http-client-tls lens taggy-lens text
    time wreq split http-types HTTP
  ];
  license = stdenv.lib.licenses.mit;
}
