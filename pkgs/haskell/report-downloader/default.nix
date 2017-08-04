{ callHsPackage, fetchgit }:
callHsPackage (fetchgit {
  url = http://git.monster.cat/report-downloader;
  rev = "486dffeb17e5311c00d263d7e0c5bc84018bd3d8";
  sha256 = "1909zkkcml32b50kjyvbz82mp4n7f8sp6f9rpzykmsa2zfr97pwq";
}) {}
