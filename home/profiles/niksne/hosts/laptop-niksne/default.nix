mkHmModules: {
  imports = mkHmModules [
    "programs"
    "programs/editors/jetbrains.nix"
    "programs/games"

    "services"

    # "terminal/emulators/wezterm.nix"
    "terminal/emulators/kitty.nix"

    ./hypridle.nix
    ./hyprland.nix
  ];
}
