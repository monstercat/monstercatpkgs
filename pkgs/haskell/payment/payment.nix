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
}:
mkDerivation {
  pname = "payment";
  version = "0.1.2";
  doCheck = false;
  src = fetchgit {
    url = http://git.zero.monster.cat/payments;
    rev = "e9f374514a246e32196777d43787d8e2fc18d770";
    sha256 = "1pawaw0aj0hvzg9lwlymdx81icviraa2z80cvih7anmhmvnaz6c0";
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
    unordered-containers uuid vector word8 yaml
  ];
  executableHaskellDepends = [
    aeson aeson-pretty ansi-wl-pprint async attoparsec base bytestring
    cased cassava data-default Decimal directory errors filepath
    flexible flexible-instances foldl formatting hashable keys lens
    lens-aeson lifted-base MissingH money mtl old-locale options parsec
    pipes pipes-bytestring pipes-csv pipes-postgresql-simple pipes-safe
    pointed pretty profunctors random safe semigroupoids semigroups
    split syb text time transformers unordered-containers uuid vector
    word8 yaml
  ];
  testHaskellDepends = [ base hspec QuickCheck tasty tasty-hspec ];
  license = stdenv.lib.licenses.bsd3;
}