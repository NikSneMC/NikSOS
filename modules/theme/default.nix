{
  config,
  lib, 
  ...
}: {
  options.theme = {
    flavor = lib.mkOption {
      description = '''';
      type = lib.types.str;
      example = lib.literalExample "mocha";
      default = "mocha";
    };
    accent = lib.mkOption {
      description = '''';
      type = lib.types.str;
      example = lib.literalExample "sky";
      default = "sky";
    };

    colors = lib.mkOption {
      description = '''';
      type = lib.types.attrs;
      readOnly = true;
      default = let
        catppuccin = builtins.mapAttrs (_: flavor: 
          (builtins.mapAttrs (_: color: color.hex) flavor.colors) // { 
            accent = flavor.colors.${config.theme.accent}.hex;
          }
        ) config.catppuccin.flavors;
      in catppuccin // catppuccin.${config.theme.flavor} // {
        notable = if config.theme.flavor == "latte" then catppuccin.mocha else catppuccin.latte;
      };
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
