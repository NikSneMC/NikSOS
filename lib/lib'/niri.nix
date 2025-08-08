{
  lib,
  numbers,
  ...
}: let
  inherit (lib) nameValuePair take;
  inherit (lib.lists) findFirstIndex;
  inherit (numbers) mod;

  mkBinds = binds:
    binds
    |> map (
      {
        bind,
        desc,
        action,
        allow-when-locked ? false,
        repeat ? false,
        cooldown-ms ? null,
      }:
        nameValuePair bind {
          hotkey-overlay.title = desc;
          inherit action allow-when-locked repeat cooldown-ms;
        }
    )
    |> builtins.listToAttrs;

  mkWorkspacesBinds = names: let
    workspaces = take 10 names;
  in
    workspaces
    |> map (name: let
      nameIndex = findFirstIndex (w: w == name) null workspaces;
      wsIndex = mod (nameIndex + 1) 10;
      ws = toString wsIndex;
    in [
      {
        bind = "Mod+${ws}";
        desc = "Focus the `${name}` workspace";
        action.focus-workspace = name;
      }
      {
        bind = "Mod+Shift+${ws}";
        desc = "Move the focused window to the `${name}` workspace";
        action.move-window-to-workspace = name;
      }
      {
        bind = "Mod+Shift+Ctrl+Alt+${ws}";
        desc = "Move the focused column to the `${name}` workspace";
        action.move-column-to-workspace = name;
      }
    ])
    |> builtins.concatLists;

  mkColumnsBinds = n:
    n
    |> builtins.genList (
      x: let
        ws = toString (mod (x + 1) 10);
        m = x + 1;
        mStr = toString m;
      in [
        {
          bind = "Mod+Alt+${ws}";
          desc = "Focus a column at index ${mStr}";
          action.focus-column = m;
        }
        {
          bind = "Mod+Alt+Shift+${ws}";
          desc = "Move column to the index ${mStr}";
          action.move-column-to-index = m;
        }
      ]
    )
    |> builtins.concatLists;
in {
  inherit mkBinds mkWorkspacesBinds mkColumnsBinds;
}
