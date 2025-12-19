{
  config,
  lib,
  lib',
  ...
}: let
  inherit (builtins) attrValues concatStringsSep;
  inherit (lib) mkIf mkEnableOption mkOption types;

  cfg = config.modules.services.xserver.xkb;
in {
  imports = [
    (import ./layouts.nix cfg)
  ];

  options.modules.services.xserver.xkb = let
    inherit (lib'.options) overrideDefaultWith;
  in {
    enable = mkEnableOption "xkb module" |> overrideDefaultWith true;

    layouts = mkOption {
      type = types.attrsOf types.str;
      default = {
        en = "rdvp";
        ru = "ru";
      };
    };

    options = mkOption {
      type = types.listOf types.str;
      default = [
        "grp:win_space_toggle"
        "compose:ralt"
      ];
    };
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;

    services.xserver.xkb = {
      layout =
        cfg.layouts
        |> attrValues
        |> concatStringsSep ", ";

      options =
        cfg.options
        |> concatStringsSep ", ";
    };

    environment.variables = let
      inherit (config.services.xserver.xkb) layout variant;
    in {
      XKB_DEFAULT_LAYOUT = layout;
      XKB_DEFAULT_VARIANT = variant;
    };
  };
}
