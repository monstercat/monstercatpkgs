{ nixpkgs ? import (fetchTarball https://github.com/jb55/nixpkgs/archive/my-master.tar.gz) {}
, profiling ? false
, compiler ? null
}:
let pkgs = nixpkgs.pkgs;
    overrideCabal = pkgs.haskell.lib.overrideCabal;
    haskellOverrides = super: {
      postgresql-simple = overrideCabal super.postgresql-simple (attrs: {
        # src = /home/jb55/dev/haskell/postgresql-simple;
        src = pkgs.fetchFromGitHub {
          owner  = "jb55";
          repo   = "postgresql-simple";
          rev    = "0e93ae2040f360fa624f031930b45728b110e155";
          sha256 = "04npgh3sxdnhlc5864d6m9raz47sr9awgydni0837ysmdr9zj17d";
        };
      });
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
    mcatPkgs = import <monstercatpkgs> { inherit haskellPackages; };
    project = callPackage ./payment.nix {
      inherit (mcatPkgs.haskellPackages)
        flexible flexible-instances money;
    };
    stdenv = nixpkgs.stdenv;
    drv = stdenv.mkDerivation rec {
      name = "payments-${version}";
      version = "3.0";

      src = project.src;

      makeFlags = "PREFIX=$(out)";

      buildPhase = ''
        ${project.env.shellHook}

        make -j$NIX_BUILD_CORES
      '';

      buildInputs = project.env.nativeBuildInputs;
    };
in
  drv
