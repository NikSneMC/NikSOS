{
  wayland.windowManager.hyprland.settings = let
    mod = "SUPER";
  in {
    env = [
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    ];
    cursor.no_hardware_cursors = true;
    monitor = [
      "eDP-1, 1920x1080@60, 0x0, 1"
      "HDMI-A-1, preferred, -3440x0, 1"
    ];

    workspace = [
      "11, monitor:HDMI-A-1"
      "12, monitor:HDMI-A-1"
      "13, monitor:HDMI-A-1"
      "14, monitor:HDMI-A-1"

      "15, monitor:eDP-1"
      "16, monitor:eDP-1"
      "17, monitor:eDP-1"
      "18, monitor:eDP-1"

      "19, monitor:VGA-1"
      "20, monitor:VGA-1"
      "21, monitor:HDMI-A-1"
      "22, monitor:HDMI-A-1"
    ];

    binddl = [
      # suspend
      "${mod} CTRL, S, Suspend computer, exec, fish -c suspend"
    ];

    binddle = [
      # backlight
      ", XF86MonBrightnessUp, Increase brightness by 5, exec, brillo -q -u 300000 -A 5"
      ", XF86MonBrightnessDown, Decrease brightness by 5, exec, brillo -q -u 300000 -U 5"
      "CTRL, XF86MonBrightnessUp, Increase brightness by 1, exec, brillo -q -u 300000 -A 1"
      "CTRL, XF86MonBrightnessDown, Decrease brightness by 1, exec, brillo -q -u 300000 -U 1"
    ];

    plugin = {
      hyprexpo = {
        columns = 3;
        gap_size = 7;
        bg_col = "$base";
        workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

        enable_gesture = true; # laptop touchpad, 4 fingers
        gesture_distance = 300; # how far is the "max"
        gesture_positive = false; # positive = swipe down. Negative = swipe up.
      };
    };
  };
}
