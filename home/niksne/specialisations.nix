{
  lib,
  config,
  ...
}: {
  theme = {
    flavor = "mocha";
    accent = "sky";

    wallpaper = let
      url = "https://raw.githubusercontent.com/NikSneMC/NikSOS/assets/bg.png";
      sha256 = "1d64c1xky96dg4gzsg17xyrjgy6wv4x0babyyfsvin9zi53p2mlp";
      filename = lib.last (lib.splitString "/" url);
    in
      builtins.fetchurl {
        name = "${sha256}-wallpaper-${filename}";
        inherit url sha256;
      };
  };

  # catppuccin = {
  #   enable = true;
  #   pointerCursor.enable = true;
  #   inherit (config.theme) flavor accent;
  # };
}
