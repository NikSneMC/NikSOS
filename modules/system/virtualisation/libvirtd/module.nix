{
  config,
  lib,
  options,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.virtualisation.libvirtd;
in {
  options.modules.virtualisation.libvirtd = {
    enable = options.virtualisation.libvirtd.enable;
  };

  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}
