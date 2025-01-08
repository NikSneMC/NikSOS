mkHmModules: {
  imports = mkHmModules [
    "programs"
    "programs/editors/jetbrains.nix"
    "programs/games"

    "services"

    "terminal/emulators/wezterm.nix"

    ./hypridle.nix
    ./hyprland.nix
  ];
}
