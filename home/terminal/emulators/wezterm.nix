{config, ...}: let
  font = "JetBrainsMono Nerd Font Mono";

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

        config.font = wezterm.font_with_fallback { "${font}", "JetBrainsMono Nerd Font Mono" }
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

        config.keys = {
          {
            key = "h",
            mods = "CTRL",
            action = wezterm.action.ActivateTabRelative(-1),
          },
          {
            key = "l",
            mods = "CTRL",
            action = wezterm.action.ActivateTabRelative(1),
          },
          {
            key = "H",
            mods = "CTRL|SHIFT",
            action = wezterm.action.MoveTabRelative(-1),
          },
          {
            key = "L",
            mods = "CTRL|SHIFT",
            action = wezterm.action.MoveTabRelative(1),
          },
          {
            key = "!",
            mods = "CTRL|SHIFT",
            action = wezterm.action.MoveTab(0),
          },
          {
            key = "@",
            mods = "CTRL|SHIFT",
            action = wezterm.action.MoveTab(1),
          },
          {
            key = "#",
            mods = "CTRL|SHIFT",
            action = wezterm.action.MoveTab(2),
          },
          {
            key = "$",
            mods = "CTRL|SHIFT",
            action = wezterm.action.MoveTab(3),
          },
          {
            key = "%",
            mods = "CTRL|SHIFT",
            action = wezterm.action.MoveTab(4),
          },
          {
            key = "^",
            mods = "CTRL|SHIFT",
            action = wezterm.action.MoveTab(5),
          },
          {
            key = "&",
            mods = "CTRL|SHIFT",
            action = wezterm.action.MoveTab(6),
          },
          {
            key = "*",
            mods = "CTRL|SHIFT",
            action = wezterm.action.MoveTab(7),
          },
          {
            key = "(",
            mods = "CTRL|SHIFT",
            action = wezterm.action.MoveTab(8),
          },
        }

        for i = 1, 9 do
          table.insert(config.keys, {
            key = tostring(i),
            mods = 'CTRL',
            action = wezterm.action.ActivateTab(i - 1),
          })
        end


        disabled_keys = {
          {
            key = "PageUp",
            mods = "CTRL|SHIFT",
          },
          {
            key = "PageDown",
            mods = "CTRL|SHIFT",
          },
          {
            key = "Tab",
            mods = "CTRL|SHIFT",
          },
          {
            key = "Tab",
            mods = "CTRL",
          },
          {
            key = "<",
            mods = "ALT|SHIFT",
          },
          {
            key = ">",
            mods = "ALT|SHIFT",
          },
        }

        for _, bind in ipairs(disabled_keys) do
          bind["action"] = wezterm.action.DisableDefaultAssignment
          table.insert(config.keys, bind)
        end

        return config
      '';
  };
  catppuccin.wezterm.apply = true;
}
