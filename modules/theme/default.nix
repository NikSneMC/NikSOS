{lib, ...}: let
  validAccents = [ "rosewater" "flamingo" "pink" "mauve" "red" "maroon" "peach" "yellow" "green" "teal" "sky" "sapphire" "blue" "lavender" ];
  validFlavours = [ "latte" "frappe" "macchiato" "mocha" ];
in {
  options.theme = rec {
    flavour = lib.mkOption {
      description = ''
      '';
      type = lib.types.enum validFlavours;
      example = lib.literalExample "mocha";
      default = "mocha";
    };
    accent = lib.mkOption {
      description = ''
      '';
      type = lib.types.enum validAccents;
      example = lib.literalExample "sky";
      default = "sky";
    };

    wallpaper = lib.mkOption {
      description = ''
        Location of the wallpaper to use throughout the system.
      '';
      type = lib.types.path;
      example = lib.literalExample "./wallpaper.png";
    };
  };
}