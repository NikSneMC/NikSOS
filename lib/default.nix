{
  inputs,
  lib,
  pkgs,
  ...
}: {
  _module.args = let
    flakeRoot = ../.;
    keys = import "${flakeRoot}/keys.nix";

    args = {inherit flakeRoot inputs keys lib pkgs;};
  in rec {
    lib' = import "${./.}/lib'" args;
    helpers = import ./helpers (args // {inherit lib';});
    inherit flakeRoot keys;
  };
}
