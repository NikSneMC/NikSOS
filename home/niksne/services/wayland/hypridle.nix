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
        beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
        lockCmd = lib.getExe config.programs.hyprlock.package;
      };

      listener = [
        {
          timeout = 330;
          onTimeout = lib.getExe config.programs.hyprlock.package;
        }
      ];
    };
  };
}
