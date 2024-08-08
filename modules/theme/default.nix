{
  lib, 
  ...
}: let
  validAccents = [
    "rosewater"
    "flamingo"
    "pink"
    "mauve"
    "red"
    "maroon"
    "peach"
    "yellow"
    "green"
    "teal"
    "sky"
    "sapphire"
    "blue"
    "lavender"
  ];
  validFlavors = [ 
    "latte"
    "frappe"
    "macchiato"
    "mocha"
  ];
in {
  options.theme = {
    flavor = lib.mkOption {
      description = '''';
      type = lib.types.enum validFlavors;
      example = lib.literalExample "mocha";
      default = "mocha";
    };
    accent = lib.mkOption {
      description = '''';
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
