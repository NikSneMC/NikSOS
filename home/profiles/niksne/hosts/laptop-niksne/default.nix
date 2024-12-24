modules: {
  imports = [
    "${modules}/programs"
    # "${modules}/programs/editors/jetbrains.nix"
    "${modules}/programs/games"

    "${modules}/services"

    "${modules}/terminal/emulators/wezterm.nix"

    ./hypridle.nix
    ./hyprland.nix
  ];
}
