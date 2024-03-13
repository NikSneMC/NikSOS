{ pkgs, nnr, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
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
    hyprlock
    wineWowPackages.waylandFull
    hyprpicker
    wezterm
    starship
    wlogout
    pyprland
  ]) ++ (with nnr; [
    hyprcursor
  ]);
}
