{
  wayland.windowManager.hyprland.settings = {
    env = [
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    ];
    cursor.no_hardware_cursors = true;
    monitor = [
      "eDP-1, 1920x1080@60, 0x0, 1"
      "HDMI-A-1, preferred, 1920x0, 1"
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
  };
}
