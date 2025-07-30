{
  lib,
  numbers,
  ...
}: let
  inherit (numbers) mod;

  mkWorkspacesBinds = n: m: a: binds:
    lib.pipe n [
      (builtins.genList (
        x:
          binds (toString (mod (x + 1) m)) (toString (x + a))
      ))
      builtins.concatLists
    ];

  mkBind = mod: rec {
    toggle = key: desc: cmd: "${mod} CTRL, ${key}, Toggle ${desc}, exec, ${cmd}";
    fishToggle = key: desc: script: toggle key desc "fish -c ${script}";
    scratchpad = key: desc: name: toggle key desc "pypr toggle ${name}";
  };
in {
  inherit mkWorkspacesBinds mkBind;
}
