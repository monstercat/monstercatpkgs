{ nixpkgs
, baseHaskellPackages
, callPackageBase
, profiling ? false
}:
let pkgs = nixpkgs.pkgs;
    haskellOverrides = origHP: {
      gogol      = origHP.gogol_0_2_0;
      gogol-core = origHP.gogol-core_0_2_0_1;
      gogol-youtube-reporting = origHP.gogol-youtube-reporting_0_2_0;
    };
    haskellPackages = baseHaskellPackages.override {
      overrides = me: orig: haskellOverrides orig;
    };
    callPackage = callPackageBase haskellPackages.callPackage;
in callPackage ./project.nix { }
