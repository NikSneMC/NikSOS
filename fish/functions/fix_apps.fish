function fix_apps
    hyprctl setcursor Catppuccin-Mocha-Teal 24 & \
    sleep 1 & \
    pkill -9 -e xdg-desktop-portal-hyprland & \
    pkill -9 -e xdg-desktop-portal-wlr & \
    pkill -9 xdg-desktop-portal & \
    /run/current-system/sw/libexec/xdg-desktop-portal-hyprland & \
    sleep 2 & \
    /run/current-system/sw/libexec/xdg-desktop-portal & \
    pkill -9 pipewire & \
    pkill -9 pipewire-pulse
end