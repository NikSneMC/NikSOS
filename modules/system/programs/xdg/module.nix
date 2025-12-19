{
  config,
  lib,
  options,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.programs.xdg;
in {
  options.modules.programs.xdg = {
    enable = options.xdg.portal.enable;
  };

  config = mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;

      config.common.default = ["gtk"];

      extraPortals = with pkgs; [
        # xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
        # xdg-desktop-portal-gnome
      ];
    };
  };
}
