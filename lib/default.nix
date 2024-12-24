{
  homeImports,
  inputs,
  lib,
  pkgs,
  self,
  ...
}: {
  _module.args = rec {
    lib' = import (./. + "/lib'") {inherit lib pkgs;};
    niksos = import ./niksos {inherit homeImports inputs lib lib' pkgs self;};
  };
}
