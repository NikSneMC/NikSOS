{
  imports = [
    ../../programs
    ../../programs/games

    ../../services

    ../../terminal/emulators/wezterm.nix
  ];

  wayland.windowManager.hyprland.settings = {
    # env = [
    #   "LIBVA_DRIVER_NAME,nvidia"
    #   "XDG_SESSION_TYPE,wayland"
    #   "GBM_BACKEND,nvidia-drm"
    #   "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    # ];
    cursor.no_hardware_cursors = true;
    monitor = [
      # "HDMI-A-1, 1440x900@60, 0x0, 1"
      # "DP-1, 3440x1440@100, 1440x0, 1"
      # "DP-2, 1920x1080@60, 4880x0, 1"
      # "Unknown-1, disable"

      "VGA-1, 1440x900@60, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, 1440x0, 1"
    ];
    workspace = [
      # "11, monitor:DP-1"
      # "12, monitor:DP-1"
      # "13, monitor:DP-1"
      # "14, monitor:DP-1"
      
      # "15, monitor:DP-2"
      # "16, monitor:DP-2"
      # "17, monitor:DP-2"
      # "18, monitor:DP-2"

      # "19, monitor:DP-2"
      # "20, monitor:DP-2"
      # "21, monitor:DP-1"
      # "22, monitor:DP-1"

      "11, monitor:HDMI-A-1"
      "12, monitor:HDMI-A-1"
      "13, monitor:HDMI-A-1"
      "14, monitor:HDMI-A-1"
      
      "15, monitor:VGA-1"
      "16, monitor:VGA-1"
      "17, monitor:VGA-1"
      "18, monitor:VGA-1"

      "19, monitor:VGA-1"
      "20, monitor:VGA-1"
      "21, monitor:HDMI-A-1"
      "22, monitor:HDMI-A-1"
    ];
  };
}
