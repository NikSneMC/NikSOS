{
  lib,
  ...
}: let 
  mkKeymaps = keymaps: lib.mapAttrsToList (
    name: value: let 
      keymap = {
        key = name; 
        action = value; 
        options.silent = true; 
      }; 
    in (if builtins.isString value then keymap else (
      keymap // value // (
        if value ? "mode" && builtins.isString value.mode then { mode = lib.stringToCharacters value.mode; } else {}
      )
    ))
  ) keymaps;
  mkDisabledKeymaps = mode: keymaps: mkKeymaps (builtins.listToAttrs (builtins.map (key: lib.nameValuePair key { action = ""; inherit mode; }) keymaps));
in {
  programs.nixvim.keymaps = (mkKeymaps {
    "jk" = {
      action = "<Esc>";
      mode = "iv";
    };
  }) ++ (mkDisabledKeymaps "inv" [
    "<Up>"
    "<Down>"
    "<Left>"
    "<Right>"
  ]);
}
