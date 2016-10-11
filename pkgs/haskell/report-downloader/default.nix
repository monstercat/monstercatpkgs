{ mkDerivation, base, bytestring, http-client
, http-client-tls, lens, stdenv, taggy-lens, text, time, wreq, fetchgit, split, http-types, HTTP
}:
mkDerivation rec {
  pname = "report-downloader";
  version = "0.3.1";
  src = fetchgit {
    url = http://git.zero.monster.cat/report-downloader;
    rev = "19203b0021ad1dfedaaab56eed7023ff5dec1bbb";
    sha256 = "099siy8rkqzgfn9mf8brva7x7yv4mldsiapq0h5jwwpad5anrpza";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring http-client http-client-tls lens taggy-lens text
    time wreq split http-types HTTP
  ];
  license = stdenv.lib.licenses.mit;
}
