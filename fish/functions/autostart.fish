function autostart
    pipewire & \
    swaync -c ~/.config/swaync/config.json & \
    dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP & \
    systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP & \
    waybar & \
    pypr & \
    swww init & \
    swww img ~/.config/background & \
    wl-paste --type text --watch cliphist store & \
    wl-paste --type image --watch cliphist store & \
    hypridle & \
    vesktop & \
    telegram-desktop & \
    whatsapp-for-linux & \
    fix_apps.fish
end
