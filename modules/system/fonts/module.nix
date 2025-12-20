{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.fonts;
in {
  options.modules.fonts = {
    enable = mkEnableOption "fonts config";
  };

  config = mkIf cfg.enable {
    fonts = {
      packages = with pkgs; [
        corefonts
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        nerd-fonts.jetbrains-mono
        nerd-fonts.noto
      ];

      enableDefaultPackages = false;

      fontconfig.defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans"];
        monospace = ["JetBrainsMono Nerd Font Mono"];
        emoji = [];
      };
    };
  };
}
