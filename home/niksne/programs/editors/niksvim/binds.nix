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
    in (if builtins.isString value then keymap else keymap // value)
  ) keymaps;
  mkDisabledKeymaps = keymaps: mkKeymaps (builtins.listToAttrs (builtins.map (key: lib.nameValuePair key "") keymaps));
in {
  programs.nixvim.keymaps = (mkKeymaps {
    "jk" = {
      action = "<Esc>";
      mode = [ "i" "v" ];
    };
  }) ++ (mkDisabledKeymaps [
    "<Up>"
    "<Down>"
    "<Left>"
    "<Right>"
  ]);
}
