{ mkDerivation
, Decimal
, MissingH
, QuickCheck
, aeson
, aeson-pretty
, ansi-wl-pprint
, async
, attoparsec
, base
, bytestring
, cased
, cassava
, data-default
, directory
, fetchgitPrivate
, filepath
, flexible
, flexible-instances
, foldl
, hashable
, keys
, lens
, lens-aeson
, lifted-base
, money
, monstercat-backend
, mtl
, options
, parsec
, pipes
, pipes-bytestring
, fetchFromGitHub
, pipes-csv
, pipes-safe
, random
, safe
, stdenv
, syb
, text
, time
, transformers
, unordered-containers
, uuid
, yaml
, overrideCabal
, haskellPackages
}:
let haskellOverrides = super: {
      pipes-csv = overrideCabal super.pipes-csv (attrs: {
        version = "1.4.2";
        src = fetchFromGitHub {
          owner = "jb55";
          repo = "pipes-csv";
          rev = "061cff94a67b9b090260e0f31eb6eeeed2952632";
          sha256 = "0z3mnhy1ims0r60iq3278wrpqsv552cr7b6bmzff2dfy0xd2x48r";
        };
      });
      cassava = overrideCabal super.cassava (attrs: {
        version = "0.4.3.1";
        src = fetchFromGitHub {
          owner = "jb55";
          repo = "cassava";
          rev = "2eb6e29bd5e141c1a9f0e980f7ac1c915e06e02a";
          sha256 = "1r1dv7yaalxja06jxqi7rjcdkb72mb2prnk8crzqap0gkmbahqcd";
        };
      });
    };
    customHaskellPackages = haskellPackages.override {
      overrides = self: super: haskellOverrides super;
    };
in mkDerivation {
  pname = "payment";
  version = "0.1.2";
  src = fetchgitPrivate {
    url = "ssh://git@phabricator.monstercat.com/diffusion/HBACK/haskell-backend.git";
    rev = "7707e4bf8847ee9036c76cb9fb02578e8fa013bf";
    sha256 = "1r1dv7yaalxja06jxqi7rjcdkb72mb2prnk8crzqap0gkmbahqc1";
  };
  buildDepends = (with customHaskellPackages; [
    Decimal
    MissingH
    QuickCheck
    aeson
    aeson-pretty
    ansi-wl-pprint
    async
    attoparsec
    base
    bytestring
    cased
    cassava
    data-default
    directory
    filepath
    flexible
    flexible-instances
    foldl
    hashable
    keys
    lens
    lens-aeson
    lifted-base
    money
    monstercat-backend
    mtl
    options
    parsec
    pipes
    pipes-bytestring
    pipes-csv
    pipes-safe
    random
    safe
    syb
    text
    time
    transformers
    unordered-containers
    uuid
    yaml
  ]);
  license = stdenv.lib.licenses.bsd3;
}
