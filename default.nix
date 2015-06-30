{ netrcFile ? "/User/jb55/.netrc"
, nixpkgs ? import <nixpkgs> {}
}:
let
  pkgs = nixpkgs;
  callPackage = pkgs.haskellPackages.callPackage;
  # TODO: fix me, doesn't seem like this is the right way to go about it,
  #       we need to be lazy in the pkg result, not the callPackage itself
  callPrivatePackage = path: pkgs:
    if netrcFile == null
    then abort "--argstr netrcFile $HOME/.netrc required for private packages"
    else callPackage path pkgs;
in rec {
  csv-parser = callPackage ./pkgs/haskell/csv-parser.nix {};

  flexible = callPackage ./pkgs/haskell/flexible.nix {};

  flexible-instances = callPackage ./pkgs/haskell/flexible-instances.nix {
    inherit flexible;
  };

  money = callPackage ./pkgs/haskell/money.nix {};

  monstercat-backend = callPrivatePackage ./pkgs/haskell/monstercat-backend.nix {
    inherit netrcFile flexible flexible-instances;
  };
}
