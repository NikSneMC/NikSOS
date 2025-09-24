{
  config,
  lib,
  ...
}: let
  inherit (lib) types mkOption mkIf;

  cfg = config.niksos.caches;
in {
  options.niksos.caches = mkOption {
    type = types.attrsOf types.str;
    default = {};
    example = {
      "cache.nixos.org?priority=10" = "6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";

      "nix-community.cachix.org" = "mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
      "wezterm.cachix.org" = "kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0=";
    };
    description = ''
      Shorthand for {option}`nix.settings.substituters` and {option}`nix.settings.trusted-public-keys`.
    '';
  };
  config = mkIf (cfg
    != {}) {
    nix.settings = {
      substituters =
        cfg
        |> builtins.attrNames
        |> map (s: "https://${s}");
      trusted-public-keys =
        cfg
        |> builtins.mapAttrs (s_: k: let
          s =
            s_
            |> builtins.split "\\?"
            |> builtins.head;
        in "${s}${k}")
        |> builtins.attrValues;
    };
  };
}
