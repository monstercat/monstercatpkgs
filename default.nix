{ nixpkgs ? import <nixpkgs> {}
, haskellPackages ? null
}:
let
  pkgs = nixpkgs;
  stdenv = pkgs.stdenv;
  hp = if haskellPackages == null
         then pkgs.haskellPackages
         else haskellPackages;
  callHsPackage = hp.callPackage;
  callPackage = pkgs.callPackage;
in rec {
  netrcFile = if (builtins.tryEval <netrc-file>).success
    then <netrc-file>
    else builtins.trace "set -I netrc-file=$HOME/netrc to access private repositories. It must not have a dot in the filename" null;

  csv-parser = callHsPackage ./pkgs/haskell/csv-parser.nix {};

  flexible = callHsPackage ./pkgs/haskell/flexible.nix {};

  flexible-instances = callHsPackage ./pkgs/haskell/flexible-instances.nix {
    inherit flexible;
  };

  csv-delim = callPackage ./pkgs/csv-delim/default.nix {};

  money = callHsPackage ./pkgs/haskell/money.nix {};

  monstercat-backend = callHsPackage ./pkgs/haskell/monstercat-backend.nix {
    inherit netrcFile flexible flexible-instances;
  };
}
