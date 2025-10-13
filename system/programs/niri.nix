{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri-flake.nixosModules.niri];

  programs.niri = {
    enable = true;
    package = inputs.niri-flake.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };

  xdg.portal.config.niri.default = ["gtk" "gnome"];
}
