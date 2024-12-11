{lib, ...}: let
  mkKeymaps = lib.mapAttrsToList (name: value:
    {
      key = name;
      action = value;
      options.silent = true;
    }
    |> (keymap:
      if builtins.isString value
      then keymap
      else (
        keymap
        // value
        // (
          if value ? "mode" && builtins.isString value.mode
          then {mode = lib.stringToCharacters value.mode;}
          else {}
        )
      )
    )
  );
  mkDisabledKeymaps = mode: keymaps:
    keymaps 
    |> map (key: lib.nameValuePair key {
        action = "";
        inherit mode;
    })
    |> builtins.listToAttrs
    |> mkKeymaps;
in {
  programs.nixvim.keymaps =
    (mkKeymaps {
      # neo-tree
      "<C-n>" = "<cmd>Neotree toggle<CR>";
      "<leader>e" = "<cmd>Neotree focus<CR>";
      # neogit
      "<leader>go" = "<cmd>Neogit<CR>";
    })
    ++ (mkDisabledKeymaps "inv" [
      "<Up>"
      "<Down>"
      "<Left>"
      "<Right>"
    ]);
}
