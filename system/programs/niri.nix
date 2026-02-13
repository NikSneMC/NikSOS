{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri-flake.nixosModules.niri];

  programs.niri = {
    enable = true;
    package = inputs.niri-flake.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };

  environment.systemPackages = [
    inputs.niri-flake.packages.${pkgs.stdenv.hostPlatform.system}.xwayland-satellite-unstable
  ];

  xdg.portal = {
    config.niri.default = ["gtk" "gnome"];

    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];

    configPackages = [
      config.programs.niri.package
    ];
  };
}
