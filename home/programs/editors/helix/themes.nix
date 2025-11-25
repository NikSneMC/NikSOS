{lib, ...}: let
  inherit (lib) nameValuePair;
in {
  programs.helix.themes =
    map (flavor: "catppuccin_${flavor}") [
      "latte"
      "frappe"
      "macciato"
      "mocha"
    ]
    |> map (theme:
      nameValuePair "${theme}-transparent" {
        inherits = theme;

        "ui.background" = {};
      })
    |> builtins.listToAttrs;
}
