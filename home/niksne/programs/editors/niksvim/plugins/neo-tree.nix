{
  lib,
  ...
}: let
  buildKeymaps = keymaps: lib.mapAttrsToList (name: value: if builtins.isString value then { key = name; action = value; mode = "n"; } else value) keymaps;
in {
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      filesystem = {
        filteredItems.visible = true;
        followCurrentFile.enabled = true;
      };
      nestingRules.__raw = "require('neotree-file-nesting-config').nesting_rules";
    };
    keymaps = buildKeymaps { 
      "<C-n>" = "<cmd>Neotree toggle<CR>";
      "<leader>e" = "<cmd>Neotree focus<CR>";
    };
  };
}
