{
  imports = [
    ../../programs
    ../../programs/games

    ../../services

    ../../terminal/emulators/wezterm.nix
  ];

  wayland.windowManager.hyprland.settings = {
    env = [
      # "LIBVA_DRIVER_NAME, nvidia"
      # "GBM_BACKEND, nvidia-drm"
      # "__GLX_VENDOR_LIBRARI_NAME, nvidia"
    ];
    monitor = [
      "HDMI-A-1, 1920x1080@60, 1440x0, 1"
      "VGA-1, 1440x900@75, 0x0, 1"
    ];
  };
}
