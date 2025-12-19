{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.programs';
in {
  options.modules.programs' = {
    enable = mkEnableOption "programs' module";
  };

  config = mkIf cfg.enable {
    programs = {
      dconf.enable = true;
      kdeconnect.enable = true;
      seahorse.enable = true;
      nix-ld.enable = true;
      gdk-pixbuf.modulePackages = [pkgs.librsvg];
    };

    modules.programs = {
      development.enable = true;
      gaming.enable = true;
      qt.enable = true;
      xdg.enable = true;
    };

    environment.systemPackages = with pkgs; [
      ffmpeg-full
    ];
  };
}
