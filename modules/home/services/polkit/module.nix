{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.services.polkit;
in {
  options.modules.services.polkit = {
    enable = mkEnableOption "polkit service module";
  };

  config = mkIf cfg.enable {
    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      Unit.Description = "polkit-gnome-authentication-agent-1";

      Install = {
        WantedBy = ["graphical-session.target"];
        Wants = ["graphical-session.target"];
        After = ["graphical-session.target"];
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
