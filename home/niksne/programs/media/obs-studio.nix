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
  sha256 = {
    latte = "sha256-pA1jQr22qRI6W75VawvN0LVc5JvB245+ta+TLvvNY2M=";
    frappe = "sha256-3yRaV/wo1wE8K18kMf2ED4/anBUkHqntAFNGwTJ6860=";
    macchiato = "sha256-xwS0gaPp/1u5aYmDk95bvFkJqJ/2kqG/zWg/oJ1olPw=";
    mocha = "sha256-z1CJ8DyVq/iKReoEAgLriiIsUBW8D3ku//My2gxC/QM=";
  }."${config.theme.flavor}";
in {
  programs.obs-studio = {
    enable = true;
    # catppuccin.enable = true;
    plugins = [];
  };

  xdg.configFile."obs-studio/themes/Catppuccin.qss".source = pkgs.fetchurl {
    name = "${sha256}-obs-theme-Catppuccin-${flavour}.qss";
    inherit url sha256;
  };
}
