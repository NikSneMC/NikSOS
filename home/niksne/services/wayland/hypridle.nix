{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  services.hypridle = {
    enable = true;

    package = inputs.hypridle.packages.${pkgs.system}.hypridle;
    
    settings = {
      general = {
        before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
        lock-cmd = lib.getExe config.programs.hyprlock.package;
      };

      listener = [
        {
          timeout = 150;
          on-timeout = config.services.hypridle.settings.general.lock_cmd;
        }
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
