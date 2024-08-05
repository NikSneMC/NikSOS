{
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require 'wezterm'
      local act = wezterm.action

      return {
        enable_tab_bar = true,
        enable_wayland = false,
        window_close_confirmation = "NeverPrompt",
        color_scheme = "Catppuccin Mocha",
        font = wezterm.font_with_fallback { "JetBrainsMono Nerd Font", "Noto Sans" }
      }
    '';
  };
}
