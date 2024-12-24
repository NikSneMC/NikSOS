{lib, ...}: let
  mkWorkspacesBinds = n: m: a: binds:
    lib.pipe n [
      (builtins.genList (
        x: let
          mod = a: b: a - a / b * b;
        in
          binds (toString (mod (x + 1) m)) (toString (x + a))
      ))
      builtins.concatLists
    ];
in {
  inherit mkWorkspacesBinds;
}
