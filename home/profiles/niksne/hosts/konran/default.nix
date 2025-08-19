mkHmModules: {
  imports = mkHmModules [
    "programs"
    "programs/editors/jetbrains.nix"
    "programs/games"
    "programs/wayland/hyprland"
    "programs/wayland/pyprland"

    "services"

    "terminal/emulators/wezterm.nix"

    ./hyprland.nix
    ./programs.nix
  ];
}
