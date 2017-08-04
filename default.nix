{ pkgs ? null
, haskellPackages ? null
, nixpkgs ? import <nixpkgs> {}
}:
let
  stdenv = pkgs_.stdenv;
  jb55pkgs = import <jb55pkgs> {};

  pkgs_ = if pkgs == null then nixpkgs.pkgs else pkgs;
  hp = if haskellPackages == null
         then pkgs_.haskellPackages
         else haskellPackages;
  callHsPackage = hp.callPackage;
  hlib = pkgs_.haskell.lib;
  callHsPackageBin = path: deps: callHsPackageBinBase hp.callPackage path deps;
  callHsPackageBinBase = baseCall: path: deps: hlib.justStaticExecutables (hlib.linkWithGold (baseCall path deps));
  overrideCabal = pkgs_.haskell.lib.overrideCabal;
  callPackage = pkgs_.callPackage;
  callRemote = p: deps: pkgs_.callPackage (pkgs_.callPackage p {}) deps;

  monstercatpkgs = rec {
    csv-delim = callPackage ./pkgs/csv-delim {};

    youtube-sheet-scraper = callRemote ./pkgs/youtube-sheet-scraper {};

    import-scripts = callRemote ./pkgs/import-scripts {
      inherit (jb55pkgs) csv-delim csv-scripts;
      inherit report-downloader tunecore2ledger;
      inherit youtube-sheet-scraper;
    };

    mcat-tools = callPackage ./pkgs/mcat-tools {};

    virtual-sheet-drive = callPackage ./pkgs/virtual-sheet-drive {};

    payments-server = callPackage ./pkgs/payments/server {};
    payments-client = callPackage ./pkgs/payments/client {};
    payments-processor = haskellPackages.payment;
    payments-parsers = callPackage ./pkgs/payments/parsers { inherit payments-processor; };
    payment-scripts = callPackage ./pkgs/payment-scripts {
      inherit payments-processor virtual-sheet-drive;
    };

    report-downloader = haskellPackages.report-downloader;
    tunecore2ledger = haskellPackages.tunecore2ledger;

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

      report-downloader = callPackage ./pkgs/haskell/report-downloader {
        callHsPackage = callHsPackageBin;
      };

      tunecore2ledger = callHsPackageBin ./pkgs/haskell/tunecore2ledger {};

      payment = import ./pkgs/haskell/payment { };

    };
  };
in monstercatpkgs
