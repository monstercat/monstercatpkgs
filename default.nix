{ netrcFile ? null }:
let
  pkgs = import <nixpkgs> { };
  callPackage = pkgs.haskellPackages.callPackage;
  callPrivatePackage = path: pkgs:
    if netrcFile == null
    then abort "--argstr netrcFile $HOME/.netrc required for private packages"
    else callPackage path pkgs;
in rec {
  flexible = callPackage ./pkgs/haskell/flexible.nix {};
  flexible-instances = callPackage ./pkgs/haskell/flexible-instances.nix {
    inherit flexible;
  };
  monstercat-backend = callPrivatePackage ./pkgs/haskell/monstercat-backend.nix {
    inherit netrcFile flexible flexible-instances;
  };
}
