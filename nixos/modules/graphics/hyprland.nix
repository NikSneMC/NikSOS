{ pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  security.pam.services.swaylock = {};

  environment.systemPackages = with pkgs; [
    waybar
    eww-wayland
    rofi-wayland
    hyprpaper
    swww
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    jq
    swaylock-effects
    swayidle
    wineWowPackages.waylandFull
    hyprpicker
    wezterm
    starship
    wlogout
    pyprland
  ];
}
