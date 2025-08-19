mkHmModules: {
  imports = mkHmModules [
    "programs"
    "programs/editors/jetbrains.nix"
    "programs/games"
    "programs/wayland/niri"

    "services"

    "terminal/emulators/wezterm.nix"

    ./hypridle.nix
    ./niri.nix
  ];
}
