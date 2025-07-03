{
  config,
  lib,
  ...
}: let
  gotoTabs = lib.pipe 9 [
    (builtins.genList (
      num: {
        name = "ctrl+alt+${toString (num + 1)}";
        value = "goto_tab ${toString (num + 1)}";
      }
    ))
    builtins.listToAttrs
  ];
in {
  programs.kitty = {
    enable = true;

    font = {
      size = 11;
      name = "JetBrainsMono Nerd Font";
    };

    settings = with config.theme.colors; {
      selection_background = "#${accent}";
      cursor = "#${accent}";
      url_color = "#${accent}";
      url_style = "straight";
      underline_hyperlinks = "always";
      window_padding_width = 3;
      confirm_os_window_close = 0;
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{index}: {title}";
      active_tab_background = "#${accent}";
      background_opacity = "0.9";
      enable_audio_bell = "no";
    };

    keybindings = gotoTabs;
  };
  catppuccin.kitty.enable = true;
}
