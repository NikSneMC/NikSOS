{
  pkgs,
  lib,
  config,
  ...
}: {
  # light/dark specialisations
  # specialisation = let
  #   colorschemePath = "/org/gnome/desktop/interface/color-scheme";
  #   dconf = "${pkgs.dconf}/bin/dconf";

  #   dconfDark = lib.hm.dag.entryAfter ["dconfSettings"] ''
  #     ${dconf} write ${colorschemePath} "'prefer-dark'"
  #   '';
  #   dconfLight = lib.hm.dag.entryAfter ["dconfSettings"] ''
  #     ${dconf} write ${colorschemePath} "'prefer-light'"
  #   '';
  # in {
  #   light.configuration = {
  #     theme.name = "light";
  #     home.activation = {inherit dconfLight;};
  #   };
  #   dark.configuration = {
  #     theme.name = "dark";
  #     home.activation = {inherit dconfDark;};
  #   };
  # };

  theme = {
    flavor = "mocha";
    accent = "sky";

    # specific to unsplash
    wallpaper = let
      url = "https://raw.githubusercontent.com/wolfcubclan/Wolfclan-DiscordTheme/main/assets/bg.png";
      sha256 = "1d64c1xky96dg4gzsg17xyrjgy6wv4x0babyyfsvin9zi53p2mlp";
      filename = lib.last (lib.splitString "/" url);
    in
      builtins.fetchurl {
        name = "${sha256}-wallpaper-${filename}";
        inherit url sha256;
      };
  };

  catppuccin = {
    enable = true;
    flavor = config.theme.flavor;
    accent = config.theme.accent;
    pointerCursor.enable = true;
  };
}