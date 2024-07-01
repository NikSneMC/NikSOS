{
  config,
  lib, 
  pkgs,
  ...
}: let
  mkUpper = str:
    with builtins;
    (lib.toUpper (substring 0 1 str)) + (substring 1 (stringLength str) str);
  flavour = mkUpper config.theme.flavor;
  url = "https://raw.githubusercontent.com/catppuccin/obs/main/themes/Catppuccin%20${flavour}.qss";
  sha256 = "sha256-z1CJ8DyVq/iKReoEAgLriiIsUBW8D3ku//My2gxC/QM=";
in {
  programs.obs-studio = {
    enable = true;
    # catppuccin.enable = true;
    plugins = [];
  };

  xdg.configFile."obs-studio/themes/Catppuccin ${flavour}.qss".source = pkgs.fetchurl {
    name = "${sha256}-obs-theme-Catppuccin-${flavour}.qss";
    inherit url sha256;
  };
}