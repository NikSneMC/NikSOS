mkHmModules: {
  imports = mkHmModules [
    "programs"
    "programs/editors/jetbrains.nix"
    "programs/games"
    "programs/wayland/niri"

    "services"

    "terminal/emulators/wezterm.nix"

    ./niri.nix
    ./programs.nix
  ];
}
