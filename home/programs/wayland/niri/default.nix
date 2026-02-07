{
  config,
  lib,
  ...
}: {
  imports = [
    ./binds.nix
    ./input.nix
    ./layout.nix
    ./rules.nix
  ];

  programs.niri.settings = {
    environment = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };

    spawn-at-startup =
      [
        ["equibop"]
        ["AyuGram"]
        ["thunderbird"]
      ]
      |> map (command: {inherit command;});

    workspaces = {
      "1".name = "development";
      "2".name = "misc";
      "3".name = "education";
      "4".name = "social";
      "5".name = "gaming";
      "6".name = "recording/streaming";
    };

    animations.slowdown = 0.5;

    screenshot-path = "~/Pictures/Screenshots/screenshot-%d-%m-%Y_%H_%M_%S.png";
    prefer-no-csd = true;

    hotkey-overlay = {
      hide-not-bound = true;
      skip-at-startup = true;
    };

    overview = {
      backdrop-color = config.theme.colors.base;
      workspace-shadow.enable = false;
    };

    gestures.hot-corners.enable = false;

    xwayland-satellite.enable = true;
  };

  xdg.configFile = {
    niri-config-dms.target = lib.mkForce "niri/dms.kdl";
    "niri/config.kdl".text =
      # kdl
      ''
        include "dms.kdl";

        recent-windows {
          highlight {
            active-color "#${config.theme.colors.accent}ff"
            urgent-color "#${config.theme.colors.peach}ff"
            padding 30
            corner-radius 0
          }
        }
      '';
  };
}
