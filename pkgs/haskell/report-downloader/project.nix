{ mkDerivation
, base
, bytestring
, fetchgit
, gogol
, gogol-core
, gogol-youtube-reporting
, HTTP
, http-client
, http-client-tls
, http-types
, lens
, split
, stdenv
, streaming
, streaming-bytestring
, streaming-utils
, taggy-lens
, text
, time
, wreq
}:
mkDerivation rec {
  pname = "report-downloader";
  version = "0.4.1";
  src = fetchgit {
    url = http://git.zero.monster.cat/report-downloader;
    rev = "f6387ad230e69719a969bedd761c3612df412af3";
    sha256 = "1cwd7b95sjvnw282y05bxmx0bwjkc071hll1577cpnqg0gra8wpq";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base
    bytestring
    gogol
    gogol-core
    gogol-youtube-reporting
    HTTP
    http-client
    http-client-tls
    http-types
    lens
    split
    streaming
    streaming-bytestring
    streaming-utils
    taggy-lens
    text
    time
    wreq
  ];
  license = stdenv.lib.licenses.mit;
}
