{ nixpkgs ? import <nixpkgs> {}
, profiling ? false
, monstercatpkgs
, compiler ? null
}:
let pkgs = nixpkgs.pkgs;
    overrideCabal = pkgs.haskell.lib.overrideCabal;
    haskellOverrides = super: {
      pipes-postgresql-simple = overrideCabal super.pipes-postgresql-simple (attrs: {
        src = pkgs.fetchFromGitHub {
          owner  = "jb55";
          repo   = "pipes-postgresql-simple";
          rev    = "dbfbfa4aad8481642ed03a3d97ca4d46983a9e79";
          sha256 = "1wq5x617gilxr46zsqvam2vz1isbasg7f71wzrk2xrnr84fb0980";
        };
      });
      pipes-csv = overrideCabal super.pipes-csv (attrs: {
        version = "1.4.2";
        src = pkgs.fetchFromGitHub {
          owner = "jb55";
          repo = "pipes-csv";
          rev = "061cff94a67b9b090260e0f31eb6eeeed2952632";
          sha256 = "0z3mnhy1ims0r60iq3278wrpqsv552cr7b6bmzff2dfy0xd2x48r";
        };
      });
      cassava = overrideCabal super.cassava (attrs: {
        version = "0.4.3.1";
        src = pkgs.fetchFromGitHub {
          owner = "jb55";
          repo = "cassava";
          rev = "2eb6e29bd5e141c1a9f0e980f7ac1c915e06e02a";
          sha256 = "1r1dv7yaalxja06jxqi7rjcdkb72mb2prnk8crzqap0gkmbahqcd";
        };
      });
    };
    baseHaskellPackages =
      if compiler != null
        then pkgs.haskell.packages.${compiler}
        else pkgs.haskellPackages;
    profilingOverride = super: if profiling then {
      mkDerivation = args: super.mkDerivation (args // {
        enableLibraryProfiling = true;
      });
    } else {};
    haskellPackages = baseHaskellPackages.override {
      overrides = self: super: profilingOverride super // haskellOverrides super;
    };
    callPackage = haskellPackages.callPackage;
in callPackage ./payment.nix {
  inherit (monstercatpkgs.haskellPackages)
    flexible flexible-instances money;
}
