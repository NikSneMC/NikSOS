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
    })
  ];

  environment.systemPackages = with pkgs; [
    thrift
#    scylladb
   ];
}