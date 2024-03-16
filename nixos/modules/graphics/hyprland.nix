{ pkgs, npkgs, inputs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  environment.systemPackages = (with pkgs; [
    waybar
    eww
    rofi-wayland
    hyprpaper
    swww
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    jq
    swaylock-effects
    hypridle
    wineWowPackages.waylandFull
    hyprpicker
    wezterm
    starship
    wlogout
    pyprland
  ]) ++ (with npkgs; [
    hyprcursor
    hyprlock
  ]);
}
