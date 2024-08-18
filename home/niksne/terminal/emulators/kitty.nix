{
  config,
  theme,
  ...
}: let
  palette = theme."${config.theme.flavor}".palette;
  accent = palette."${config.theme.accent}";
in {
  programs.kitty = {
    enable = true;

    catppuccin.enable = true;
    shellIntegration.enableFishIntegration = true;

    font = {
      size = 10;
      name = "JetBrainsMono Nerd Font";
    };

    settings = {
      cursor = accent;
      url_color = accent;
      url_style = "straight";
      underline_hyperlinks = "always";
      window_padding_width = 3;
      confirm_os_window_close = 0;
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{index}: {title}";
      active_tab_background = accent;
      
    };
  };
}
