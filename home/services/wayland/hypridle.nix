{
  lib,
  config,
  ...
}: {
  services.hypridle = {
    enable = true;

    settings = {
      general = let
        hyprlock = lib.getExe config.programs.hyprlock.package;
      in {
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        lock-cmd = "pidof ${hyprlock} || ${hyprlock}";
      };

      listener = [
        {
          timeout = 150;
          on-timeout = config.services.hypridle.settings.general.lock-cmd;
        }
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = config.services.hypridle.settings.general.after_sleep_cmd;
        }
      ];
    };
  };
}
