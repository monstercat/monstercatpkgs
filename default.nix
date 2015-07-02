{ nixpkgs ? import <nixpkgs> {}
, compiler ? "ghc7101"
}:
let
  pkgs = nixpkgs;
  callPackage = nixpkgs.pkgs.haskell.packages.${compiler}.callPackage;
in rec {
  netrcFile = if (builtins.tryEval <netrc-file>).success
    then <netrc-file>
    else builtins.trace "set -I netrc-file=$HOME/netrc to access private repositories. It must not have a dot in the filename" null;

  csv-parser = callPackage ./pkgs/haskell/csv-parser.nix {};

  flexible = callPackage ./pkgs/haskell/flexible.nix {};

  flexible-instances = callPackage ./pkgs/haskell/flexible-instances.nix {
    inherit flexible;
  };

  money = callPackage ./pkgs/haskell/money.nix {};

  monstercat-backend = callPackage ./pkgs/haskell/monstercat-backend.nix {
    inherit netrcFile flexible flexible-instances;
  };
}
