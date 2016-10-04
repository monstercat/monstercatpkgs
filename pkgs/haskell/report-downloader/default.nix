{ mkDerivation, base, bytestring, http-client
, http-client-tls, lens, stdenv, taggy-lens, text, time, wreq, fetchgit, split, http-types, HTTP
}:
mkDerivation rec {
  pname = "report-downloader";
  version = "0.3";
  src = fetchgit {
    url = http://git.zero.monster.cat/report-downloader;
    rev = "35295bb80362983c9284c9f5d96f1cea00609b19";
    sha256 = "18b1nvffhkqy4d1rrn7p46jgj40qxyi7rhgh8nnr59hfyb3h9n90";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring http-client http-client-tls lens taggy-lens text
    time wreq split http-types HTTP
  ];
  license = stdenv.lib.licenses.mit;
}
