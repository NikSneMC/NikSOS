{
  lib,
  numbers,
  ...
}: let
  inherit (lib) nameValuePair take;
  inherit (lib.lists) findFirstIndex;
  inherit (numbers) mod;

  rebinds = {
    "1" = "Ampersand";
    "2" = "Bracketleft";
    "3" = "BraceLeft";
    "4" = "BraceRight";
    "5" = "ParenLeft";
    "6" = "Equal";
    "7" = "Asterisk";
    "8" = "ParenRight";
    "9" = "Plus";
    "0" = "BracketRight";
  };

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
    |> map (
      name: let
        nameIndex = findFirstIndex (w: w == name) null workspaces;
        wsIndex = mod (nameIndex + 1) 10;
        ws_ru = toString wsIndex;
        ws_en = rebinds.${ws_ru};
      in
        [ws_ru ws_en]
        |> map (ws: [
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
        |> builtins.concatLists
    )
    |> builtins.concatLists;

  mkColumnsBinds = n:
    n
    |> builtins.genList (
      x: let
        m = x + 1;
        ws_ru = toString (mod m 10);
        ws_en = rebinds.${ws_ru};
        mStr = toString m;
      in
        [ws_ru ws_en]
        |> map (ws: [
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
        ])
        |> builtins.concatLists
    )
    |> builtins.concatLists;
in {
  inherit mkBinds mkWorkspacesBinds mkColumnsBinds;
}
