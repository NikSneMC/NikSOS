{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  mkUpper = str:
    with builtins;
      (lib.toUpper (substring 0 1 str)) + (substring 1 (stringLength str) str);

  font = "JetBrainsMono Nerd Font";

  mkTabColorFg = bg: fg: ''{ bg_color = "#${config.theme.colors.${bg}}", fg_color = "#${config.theme.colors.${fg}}" }'';

  mkTabColor = bg: mkTabColorFg bg "text";
in {
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;

    extraConfig = ''
      local wezterm = require 'wezterm'
      local act = wezterm.action

      return {
        window_close_confirmation = "NeverPrompt",

        enable_tab_bar = true,
        hide_tab_bar_if_only_one_tab = true,

        color_scheme = "Catppuccin ${mkUpper config.theme.flavor}",
        font = wezterm.font_with_fallback { "${font}", "Noto Sans" },
        window_frame = {
          font = wezterm.font { family = "${font}", weight = 'Bold' },
          font_size = 10,
          active_titlebar_bg = "#${config.theme.colors.crust}"
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
        window_background_opacity = 0.9
      }
    '';
  };
}
