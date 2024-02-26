{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      scylladb = prev.scylladb.overrideAttrs(old: rec {
        version = "5.2.15";
        src = prev.fetchFromGitHub {
            owner = "scylladb";
            repo = "scylladb";
            rev = "fd32e2ee103acaa54cc7362b64eccd6a7f6aaf38";
            hash = "sha256-EZXIHUFjo/GvqkGrAgQRI53Aovp+V/9ytH2jJ7dJxoY=";
          };
      });
      thrift = prev.thrift.overrideAttrs(old: rec {
        pname = "thrift";
        version = "0.18.1";
        src = prev.fetchurl {
            url = "https://archive.apache.org/dist/thrift/${version}/${pname}-${version}.tar.gz";
            hash = "sha256-BMbxDl14jKeOE+4u8NIVLHsHDAr1VIPWuULinP8pZyY=";
        };
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    thrift
    scylladb
   ];
}