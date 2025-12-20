{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.modules.core = {
    tags = mkOption {
      type = types.listOf (types.enum [
        "desktop"
        "laptop"
        "wsl"
        "avf"
        "builder"
      ]);
    };
  };
}
