{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf recursiveUpdate;

  cfg = config.modules.hardware.printing;
in {
  options.modules.hardware.printing = {
    enable = mkEnableOption "printing module";
    share = mkEnableOption "printer sharing module";
  };

  config = mkIf cfg.enable {
    hardware.sane.enable = true;
    services =
      {
        printing = {
          enable = true;
          drivers = with pkgs; [
            hplipWithPlugin
            samsung-unified-linux-driver
            epson-escpr
          ];
        };
        avahi = {
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
        };
      }
      |> recursiveUpdate (mkIf cfg.share {
        avahi.publish = {
          enable = true;
          userServices = true;
        };
        printing = {
          listenAddresses = ["*:631"];
          allowFrom = ["all"];
          browsing = true;
          defaultShared = true;
          openFirewall = true;
        };
      });
  };
}
