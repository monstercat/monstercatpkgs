{ callHsPackage, fetchgit }:
callHsPackage (fetchgit {
  url = "http://git.monster.cat/itunes-processor";
  rev = "04ab5dc84c71a88f494c1dd29918760cb3916339";
  sha256 = "1zwslnf2pbxs85p6zs14zi2fzbgk3dyh6d3gr0rn8rd4d956px2y";
}) {}
