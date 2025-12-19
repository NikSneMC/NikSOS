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
        removeHash = builtins.substring 1 6;
        catppuccin =
          "${config.catppuccin.sources.palette}/palette.json"
          |> builtins.readFile
          |> builtins.fromJSON
          |> builtins.mapAttrs (
            _: flavor:
              (builtins.mapAttrs (_: color: removeHash color.hex) flavor.colors)
              // {
                accent = removeHash flavor.colors.${config.theme.accent}.hex;
              }
          );
      in
        catppuccin
        // catppuccin.${config.theme.flavor}
        // {
          notable =
            if config.theme.flavor == "latte"
            then catppuccin.mocha
            else catppuccin.latte;
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

  config.catppuccin = {
    enable = true;
    cursors.enable = true;
    inherit (config.theme) flavor accent;
  };
}
