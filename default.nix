{ pkgs ? null
, haskellPackages ? null
}:
let
  stdenv = pkgs_.stdenv;
  nixpkgs = import <nixpkgs> {};
  pkgs_ = if pkgs == null then nixpkgs.pkgs else pkgs;
  hp = if haskellPackages == null
         then pkgs_.haskellPackages
         else haskellPackages;
  callHsPackage = hp.callPackage;
  overrideCabal = pkgs_.haskell.lib.overrideCabal;
  callPackage = pkgs_.callPackage;
in {
  csv-delim = callPackage ./pkgs/csv-delim/default.nix {};

  haskellPackages = rec {
    csv-parser = callHsPackage ./pkgs/haskell/csv-parser.nix {};

    flexible = callHsPackage ./pkgs/haskell/flexible.nix {};

    flexible-instances = callHsPackage ./pkgs/haskell/flexible-instances.nix {
      inherit flexible;
    };

    money = callHsPackage ./pkgs/haskell/money.nix {};

    # monstercat-backend = callHsPackage ./pkgs/haskell/monstercat-backend.nix {
    #   inherit flexible flexible-instances;
    # };

    # payment = callHsPackage ./pkgs/haskell/payment {
    #   inherit flexible flexible-instances overrideCabal;
    # };

  };
}
