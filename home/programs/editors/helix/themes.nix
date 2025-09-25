{lib, ...}: let
  inherit (lib) nameValuePair;

  mkTransparentTheme = name: {
    inherits = name;

    "ui.background" = {};
  };
in {
  programs.helix.themes =
    [
      "latte"
      "frappe"
      "macciato"
      "mocha"
    ]
    |> map (flavor: "catppuccin_${flavor}")
    |> map (theme: nameValuePair "${theme}-transparent" (mkTransparentTheme theme))
    |> builtins.listToAttrs;
}
