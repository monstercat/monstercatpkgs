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
  version = "0.4.2";
  src = fetchgit {
    url = http://git.zero.monster.cat/report-downloader;
    rev = "f9e5822dbb5cc5ba04297f1caa0a73885c200a91";
    sha256 = "0wc609v3nl8r91g5qj163rax4hmbxyn7bvbi9s3mkk3fp2s27fvh";
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
