{lib, ...}: let
  inherit (lib) range;

  range0 = n: range 0 (n - 1);
in {
  inherit range0;
}
