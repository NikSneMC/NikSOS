{config, ...}: let
  font = "JetBrainsMono Nerd Font";

  mkTabColorFg = bg: fg:
  # lua
  ''
    {
      bg_color = "#${config.theme.colors.${bg}}",
      fg_color = "#${config.theme.colors.${fg}}"
    }
  '';
  mkTabColor = bg: mkTabColorFg bg "text";
in {
  programs.wezterm = {
    enable = true;
    # package = inputs.wezterm.packages.${pkgs.system}.default;

    extraConfig =
      # lua
      ''
        config.window_close_confirmation = "NeverPrompt"

        config.enable_tab_bar = true
        config.hide_tab_bar_if_only_one_tab = true

        config.font = wezterm.font_with_fallback { "${font}", "JetBrainsMono Nerd Font" }
        config.window_frame = {
          font = wezterm.font { family = "${font}", weight = "Bold" },
          font_size = 10,
          active_titlebar_bg = "#${config.theme.colors.crust}",
        }
        config.colors = {
          tab_bar = {
            active_tab = ${mkTabColorFg "${config.theme.accent}" "crust"},
            inactive_tab = ${mkTabColor "mantle"},
            inactive_tab_hover = ${mkTabColor "base"},
            new_tab = ${mkTabColor "surface0"},
            new_tab_hover = ${mkTabColor "surface1"}
          }
        }
        config.window_background_opacity = 0.9

        return config
      '';
  };
  catppuccin.wezterm.apply = true;
}
