{
  pkgs,
  inputs,
  ...
}: let
  pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  hardware.opengl = {
    enable = true;
    package = pkgs-hyprland.mesa.drivers;

    # extraPackages = with pkgs; [
    #   libva
    #   vaapiVdpau
    #   libvdpau-va-gl
    # ];
    # extraPackages32 = with pkgs.pkgsi686Linux; [
    #   vaapiVdpau
    #   libvdpau-va-gl
    # ];
  };
}
