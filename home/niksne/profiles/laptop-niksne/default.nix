{
  imports = [
    ../../programs

    ../../services

    ../../terminal/emulators/wezterm.nix
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "HDMI-A-1, 1920x1080@60, 1440x0, 1"
      "VGA-1, 1440x900@75, 0x0, 1"
    ];
  };
}
