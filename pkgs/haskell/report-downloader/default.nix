{ callHsPackage, fetchgit }:
callHsPackage (fetchgit {
  url = http://git.monster.cat/report-downloader;
  rev = "df5dbb044ab3fb35255c0685f606b65133822e24";
  sha256 = "12r80ad9r4l4vsmc6dczcjn93wp7awfs4y1r0yagvmwdqnk96lpv";
}) {}
