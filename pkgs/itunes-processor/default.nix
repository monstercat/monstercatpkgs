{ callHsPackage, fetchgit }:
callHsPackage (fetchgit {
  url = "http://git.monster.cat/itunes-processor";
  rev = "94427f7f56a4e1330add96c6a89d75b8350c7982";
  sha256 = "0g67hak44w05ji0z09xb9vxhrg292vwy8win7n3p31jqy1fzsj02";
}) {}
