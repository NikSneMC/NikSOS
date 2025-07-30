{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.default;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  hardware.graphics.package = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.system}.mesa;
  environment.variables.NIXOS_OZONE_WL = "1";
  xdg.portal.config.hyprland.default = ["gtk" "hyprland"];
}
