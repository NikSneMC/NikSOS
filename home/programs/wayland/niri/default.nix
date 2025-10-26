{
  config,
  inputs,
  lib,
  lib',
  pkgs,
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

    spawn-at-startup = let
      inherit (lib) getExe;
    in
      [
        ["${getExe pkgs.wl-gammarelay-rs}" "run"]
        ["waybar"]
        ["fish" "-c" "wl-paste --type text --watch cliphist store"]
        ["fish" "-c" "wl-paste --type image --watch cliphist store"]
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
      "scratchpads".name = lib'.niri.scratchpadsWsName;
    };

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

    xwayland-satellite = {
      enable = true;
      path = lib.getExe inputs.niri-flake.packages.${pkgs.stdenv.hostPlatform.system}.xwayland-satellite-unstable;
    };
  };
}
