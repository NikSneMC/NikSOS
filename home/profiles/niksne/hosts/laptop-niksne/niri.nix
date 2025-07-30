{
  programs.niri.settings = {
    environment = {
      "GBM_BACKEND" = "nvidia-drm";
      "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
      "LIBVA_DRIVER_NAME" = "nvidia";
    };

    outputs = {
      "eDP-1" = {
        focus-at-startup = true;
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        position = {
          x = 0;
          y = 0;
        };
      };
      "HDMI-A-1" = {};
    };

    workspaces = {
      "1".open-on-output = "HDMI-A-1";
      "2".open-on-output = "eDP-1";
      "3".open-on-output = "HDMI-A-1";
      "4".open-on-output = "eDP-1";
      "5".open-on-output = "HDMI-A-1";
      "6".open-on-output = "eDP-1";
    };
  };
}
