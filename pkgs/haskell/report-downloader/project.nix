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
  version = "0.4.4";
  src = fetchgit {
    url = http://git.monster.cat/report-downloader;
    rev = "c182b04aad2ddcbf4bab0824d35f45ca70364b32";
    sha256 = "0bvzk0p6ckbg4yni78k62sy7hcgb4zrzjsbvl8kpfqmg6yfdbncs";
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
