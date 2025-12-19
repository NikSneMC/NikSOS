{
  programs.niri.settings = {
    environment = {
      "GBM_BACKEND" = "nvidia-drm";
      "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
      "LIBVA_DRIVER_NAME" = "nvidia";
    };

    outputs = {
      "DP-1" = {
        focus-at-startup = true;
        mode = {
          width = 3440;
          height = 1440;
          refresh = 60.0;
        };
        position = {
          x = 0;
          y = 0;
        };
        scale = 1;
      };
      "HDMI-A-1" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        position = {
          x = 3440;
          y = 0;
        };
        scale = 1;
      };
      "VGA-1" = {
        mode = {
          width = 1440;
          height = 900;
          refresh = 60.0;
        };
        position = {
          x = -1440;
          y = 0;
        };
        scale = 1;
      };
    };

    workspaces = {
      "1".open-on-output = "HDMI-A-1";
      "2".open-on-output = "eDP-1";
      "3".open-on-output = "HDMI-A-1";
      "4".open-on-output = "eDP-1";
      "5".open-on-output = "HDMI-A-1";
      "6".open-on-output = "VGA-1";
    };
  };
}
