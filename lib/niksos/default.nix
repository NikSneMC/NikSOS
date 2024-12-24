{
  homeImports,
  inputs,
  lib,
  lib',
  pkgs,
  self,
  ...
}: let
  homes = import ./homes.nix {inherit inputs lib lib' pkgs self;};
  hosts = import ./hosts.nix {inherit homeImports inputs lib lib' self;};
in {
  inherit homes hosts;
  inherit (homes) mkHomes;
  inherit (hosts) mkHosts;
}
