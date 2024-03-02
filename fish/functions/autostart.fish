function autostart
    pipewire & \
    swaync -c ~/.config/swaync/config.json & \
    dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP & \
    systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP & \
    waybar & \
    pypr & \
    # hyprpaper & \
    swww init && swww img ~/Pictures/Wallpapers/catppuccin-mocha-teal.jpg & \
    wl-paste --type text --watch cliphist store & \
    wl-paste --type image --watch cliphist store & \
    hyprctl setcursor Catppuccin-Mocha-Teal 24 &\
    ~/.config/hypr/scripts/apps_fix.sh & \
    swayidle -w & \
    vesktop & \
    telegram-desktop & \
    whatsapp-for-linux
end
