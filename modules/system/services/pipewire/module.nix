{
  config,
  lib,
  options,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.services.pipewire;
in {
  options.modules.services.pipewire = {
    enable = options.services.pipewire.enable;
  };

  config = mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
    };

    services.pulseaudio.enable = lib.mkForce false;
  };
}
