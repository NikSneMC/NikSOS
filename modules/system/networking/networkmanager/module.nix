{
  config,
  lib,
  lib',
  ...
}: let
  inherit (lib) mkIf;
  inherit (lib'.tags.stateful config) withoutTags;
in {
  config = mkIf (withoutTags ["wsl" "avf"]) {
    networking.networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
  };
}
