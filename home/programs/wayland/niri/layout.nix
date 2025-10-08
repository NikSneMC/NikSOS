{config, ...}: let
  inherit (config.theme) colors;

  proportion = proportion: {inherit proportion;};
in {
  programs.niri.settings.layout = {
    border = {
      enable = true;
      width = 4;
      active.color = "#${colors.accent}";
      inactive.color = "#${colors.surface1}";
      urgent.color = "#${colors.peach}";
    };

    focus-ring.enable = false;

    shadow = {
      enable = false;
      color = "#${colors.accent}";
      inactive-color = "#${colors.base}";
    };

    insert-hint = {
      enable = true;
      display.color = "#${colors.accent}99";
    };

    background-color = "transparent";

    default-column-width = proportion 1.;
    preset-column-widths =
      [
        (1. / 3)
        (1. / 2)
        (2. / 3)
        1.
      ]
      |> map proportion;
    preset-window-heights = [];

    always-center-single-column = true;

    tab-indicator = {
      enable = true;
      gap = 3;
      gaps-between-tabs = 3;
      width = 3;
      active.color = "#${colors.accent}";
      inactive.color = "#${colors.surface1}";
      urgent.color = "#${colors.peach}";
    };

    gaps = 10;
  };
}
