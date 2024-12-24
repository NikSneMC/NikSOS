{lib, ...}: let
  mkUpper = str:
    with builtins;
      (lib.toUpper (substring 0 1 str)) + (substring 1 (stringLength str) str);
in {
  inherit mkUpper;
}
