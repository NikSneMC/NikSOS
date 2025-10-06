{
  homeImports,
  inputs,
  lib,
  pkgs,
  self,
  ...
}: {
  _module.args = let
    args = {inherit homeImports inputs lib pkgs self;};
  in rec {
    lib' = import "${./.}/lib'" args;
    niksos = import ./niksos (args // {inherit lib';});
  };
}
