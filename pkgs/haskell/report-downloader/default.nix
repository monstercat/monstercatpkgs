{ mkDerivation, base, bytestring, http-client
, http-client-tls, lens, stdenv, taggy-lens, text, time, wreq, fetchgit, split, http-types, HTTP
}:
mkDerivation rec {
  pname = "report-downloader";
  version = "0.3.2";
  src = fetchgit {
    url = http://git.zero.monster.cat/report-downloader;
    rev = "8bad629d5e364b9680552866949ea91549ec2efd";
    sha256 = "0qv4a57mnr168rffds2spxpr7v801p3kwyx0wj77a8csdjm65l5s";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring http-client http-client-tls lens taggy-lens text
    time wreq split http-types HTTP
  ];
  license = stdenv.lib.licenses.mit;
}
