{
  inputs,
  ...
}: {
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  environment.variables.NIXOS_OZONE_WL = "1";

  programs.hyprland.enable = true;
}
