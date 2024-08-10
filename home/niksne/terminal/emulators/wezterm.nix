{
  config,
  lib,
  theme,
  ...
}:
let
  mkUpper = str:
    with builtins;
    (lib.toUpper (substring 0 1 str)) + (substring 1 (stringLength str) str);

  palette = theme."${config.theme.flavor}".palette;

  font = "JetBrainsMono Nerd Font";

  mkTabColorFg = bg: fg: ''{ bg_color = "${palette."${bg}"}", fg_color = "${palette."${fg}"}" }'';

  mkTabColor = bg: mkTabColorFg bg "text";
in {  
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require 'wezterm'
      local act = wezterm.action

      return {
        window_frame = {
          font = wezterm.font { family = "${font}", weight = 'Bold' },
          active_titlebar_bg = "${palette.crust}"
        },

        colors = {
          tab_bar = {
            active_tab = ${mkTabColorFg "${config.theme.accent}" "crust"},
            inactive_tab = ${mkTabColor "mantle"},
            inactive_tab_hover = ${mkTabColor "base"},
            new_tab = ${mkTabColor "surface0"},
            new_tab_hover = ${mkTabColor "surface1"}
          }
        },

        enable_tab_bar = true,
        enable_wayland = false,
        window_close_confirmation = "NeverPrompt",
        color_scheme = "Catppuccin ${mkUpper config.theme.flavor}",
        font = wezterm.font_with_fallback { "${font}", "Noto Sans" }
      }
    '';
  };
}
