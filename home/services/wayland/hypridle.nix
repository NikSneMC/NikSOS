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
        after_sleep_cmd = "niri msg action power-on-monitors";
        lock_cmd = "pidof ${hyprlock} || ${hyprlock}";
      };

      listener = let
        inherit (config.services.hypridle.settings) general;
      in [
        {
          timeout = 150;
          on-timeout = general.lock_cmd;
        }
        {
          timeout = 300;
          on-timeout = "niri msg action power-off-monitors";
          on-resume = general.after_sleep_cmd;
        }
      ];
    };
  };
}
