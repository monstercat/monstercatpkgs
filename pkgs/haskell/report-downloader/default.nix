{ callHsPackage, fetchgit }:
callHsPackage (fetchgit {
  url = http://git.monster.cat/report-downloader;
  rev = "cb67c80dc550516c0edfcdc61c6a001ad21ad9bf";
  sha256 = "1j5lwic2a4ivb3dhlh2h8dfpsj730rhclrbbbgb92nh02a0f8ga3";
}) {}
