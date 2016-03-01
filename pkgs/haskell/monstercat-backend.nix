{ Decimal
, MissingH
, aeson
, async
, attoparsec
, base
, bson
, bytestring
, compact-string-fix
, conduit
, data-default
, failure
, fetchgit
, flexible
, flexible-instances
, ghc-prim
, hashable
, hashable-generics
, lens
, mkDerivation
, mongoDB
, mtl
, persistent
, persistent-mongoDB
, persistent-template
, pwstore-fast
, safe
, stdenv
, template-haskell
, text
, time
, transformers
, unordered-containers
, uuid
, vector
, word8
}:

mkDerivation rec {
  pname = "monstercat-backend";
  version = "1.1.0";

  # todo: get fetchgitPrivate working
  src = fetchgit {
    url = "file:///dropbox/projects/monstercat/haskell/monstercat-backend";
    rev = "7707e4bf8847ee9036c76cb9fb02578e8fa013bf";
    sha256 = "1xj1z7nyww2zirnrsh50i8xw7alidaj9fpfz8qvj12d6syiwrqlz";
  };

  buildDepends = [
    Decimal
    MissingH
    aeson
    async
    attoparsec
    base
    bson
    bytestring
    compact-string-fix
    conduit
    data-default
    failure
    flexible
    flexible-instances
    ghc-prim
    hashable
    lens
    mongoDB
    mtl
    persistent
    persistent-mongoDB
    persistent-template
    pwstore-fast
    safe
    template-haskell
    text
    time
    transformers
    unordered-containers
    uuid
    vector
    word8
  ];

  description = "Monstercat backend database";
  license = stdenv.lib.licenses.unfree;
}
