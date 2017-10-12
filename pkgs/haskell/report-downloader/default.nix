{ callHsPackage, fetchgit }:
callHsPackage (fetchgit {
  url = http://git.monster.cat/report-downloader;
  rev = "6a9d4139a7a7fa2accbd98b8604c3123b131a781";
  sha256 = "1f40x5q14cs3rsy4sl3r7vdzvabjjbm53fs5mibi6ncxa7rzal1m";
}) {}
