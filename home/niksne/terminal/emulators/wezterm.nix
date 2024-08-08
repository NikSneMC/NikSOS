{
  config,
  lib,
  ...
}:
let
  mkUpper = str:
    with builtins;
    (lib.toUpper (substring 0 1 str)) + (substring 1 (stringLength str) str);
in {
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require 'wezterm'
      local act = wezterm.action

      return {
        enable_tab_bar = true,
        enable_wayland = false,
        window_close_confirmation = "NeverPrompt",
        color_scheme = "Catppuccin ${mkUpper config.theme.flavor}",
        font = wezterm.font_with_fallback { "JetBrainsMono Nerd Font", "Noto Sans" }
      }
    '';
  };
}
