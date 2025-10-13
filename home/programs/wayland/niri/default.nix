{
  config,
  inputs,
  lib,
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
    spawn-at-startup = let
      inherit (lib) getExe;
    in
      [
        ["${getExe pkgs.wl-gammarelay-rs}" "run"]
        ["waybar"]
        ["fish" "-c" "wl-paste --type text --watch cliphist store"]
        ["fish" "-c" "wl-paste --type image --watch cliphist store"]
        ["equibop"]
        ["${getExe pkgs.ayugram-desktop}"]
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
