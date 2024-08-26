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
    in if builtins.isString value then keymap else keymap // value
  ) keymaps;
in {
  programs.nixvim.keymaps = mkKeymaps {
    "jk" = {
      action ="<Esc>";
      mode = [ "i" "v" ];
    };
  };
}
