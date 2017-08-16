{ callHsPackage, fetchgit }:
callHsPackage (fetchgit {
  url = http://git.monster.cat/report-downloader;
  rev = "bdb97bcbde3ce286b75b795a231697dc8ef289fa";
  sha256 = "0xgw2wgyk10vfqf7qfjh8xxvls5w7pjh5gy0b8ny5c4m7ag000xx";
}) {}
