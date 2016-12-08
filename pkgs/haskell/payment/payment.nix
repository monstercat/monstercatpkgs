{ mkDerivation, aeson, aeson-pretty, ansi-wl-pprint, async
, attoparsec, base, bson, bytestring, cased, cassava, containers
, data-default, Decimal, directory, errors, exceptions, filepath
, flexible, flexible-instances, foldl, formatting, hashable, hspec
, keys, lens, lens-aeson, lifted-async, lifted-base, MissingH
, monad-control, money, mongoDB, mtl, old-locale, options, parsec
, persistent, persistent-mongoDB, persistent-template, pipes
, pipes-bytestring, pipes-concurrency, pipes-csv
, pipes-postgresql-simple, pipes-safe, pointed, postgresql-simple
, pretty, profunctors, QuickCheck, random, safe, semigroupoids
, semigroups, split, stdenv, syb, tasty, tasty-hspec
, template-haskell, text, time, transformers, transformers-base
, unordered-containers, uuid, vector, word8, yaml, fetchgit
, pipes-shell, system-filepath, turtle, virtual-sheet-drive
}:
mkDerivation {
  pname = "payment";
  version = "3.0.0";
  doCheck = false;
  src = fetchgit {
    url = http://git.zero.monster.cat/payments;
    rev = "059d0aa066200e4865b9b6ecf055756de44905d2";
    sha256 = "1nkifnag5ngk2073gfj040g418gpijk6ds02k4lj4ffbq5b2iwkp";
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson aeson-pretty ansi-wl-pprint async attoparsec base bson
    bytestring cased cassava containers data-default Decimal directory
    errors exceptions filepath flexible flexible-instances foldl
    formatting hashable keys lens lens-aeson lifted-async lifted-base
    MissingH monad-control money mongoDB mtl old-locale options parsec
    persistent persistent-mongoDB persistent-template pipes
    pipes-bytestring pipes-concurrency pipes-csv
    pipes-postgresql-simple pipes-safe pointed postgresql-simple pretty
    profunctors QuickCheck random safe semigroupoids semigroups split
    syb template-haskell text time transformers transformers-base
    unordered-containers uuid vector word8 yaml pipes-shell system-filepath
    turtle
  ];
  executableHaskellDepends = [
    aeson aeson-pretty ansi-wl-pprint async attoparsec base bytestring
    cased cassava data-default Decimal directory errors filepath
    flexible flexible-instances foldl formatting hashable keys lens
    lens-aeson lifted-base MissingH money mtl old-locale options parsec
    pipes pipes-bytestring pipes-csv pipes-postgresql-simple pipes-safe
    pointed pretty profunctors random safe semigroupoids semigroups
    split syb text time transformers unordered-containers uuid vector
    word8 yaml virtual-sheet-drive pipes-shell system-filepath turtle
  ];
  testHaskellDepends = [ base hspec QuickCheck tasty tasty-hspec ];
  license = stdenv.lib.licenses.bsd3;
}

