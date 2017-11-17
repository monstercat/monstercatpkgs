{ callHsPackage, fetchgit }:
callHsPackage (fetchgit {
  url = "http://git.monster.cat/itunes-processor";
  rev = "e428c7e22d805aa493c6baae82e58eb207cc622c";
  sha256 = "1rd5zvf6m2fwvfklxjw6g09adqs98vn47rjikl56kaxyrsfak4i6";
}) {}
