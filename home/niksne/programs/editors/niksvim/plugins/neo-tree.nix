{
  lib,
  ...
}: let
  buildKeymaps = keymaps: lib.mapAttrsToList (name: value: { key = name; action = value; mode = "n"; }) keymaps;
in {
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      filesystem.filteredItems.visible = true;
    };
    keymaps = buildKeymaps { 
      "<C-n>" = "<cmd>Neotree toggle<CR>";
      "<leader>e" = "<cmd>Neotree focus<CR>"; 
    };
  };
}
