{config, ...}: {
  programs.niri.settings.layout = {
    border = {
      enable = true;
      width = 4;
      active.color = "#${config.theme.colors.accent}";
      inactive.color = "#${config.theme.colors.surface1}";
      urgent.color = "#${config.theme.colors.peach}";
    };

    focus-ring.enable = false;

    shadow = {
      enable = false;
      color = "#${config.theme.colors.accent}";
      inactive-color = "#${config.theme.colors.base}";
    };

    insert-hint = {
      enable = true;
      display.color = "#${config.theme.colors.accent}99";
    };

    background-color = "transparent";

    preset-column-widths = [];
    preset-window-heights = [];

    always-center-single-column = true;

    tab-indicator = {
      enable = true;
      gap = 3;
      gaps-between-tabs = 3;
      width = 3;
      active.color = "#${config.theme.colors.accent}";
      inactive.color = "#${config.theme.colors.surface1}";
      urgent.color = "#${config.theme.colors.peach}";
    };

    gaps = 10;
  };
}
