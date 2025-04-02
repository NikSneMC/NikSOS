{
  config,
  lib,
  ...
}: {
  programs.rio = {
    enable = true;
    settings = {
      colors = with config.theme.colors; {
        bar = "#${mantle}";
        tabs-foreground = "#${text}";
        tabs-active = lib.mkForce "#${accent}";
        tabs-active-highlight = "#${accent}";
        tabs-active-foreground = "#${crust}";
      };
      confirm-before-quit = false;
      fonts = {
        family = "JetBrainsMono Nerd Font";
        size = 15;
        extras = [{family = "Noto Sans Mono CJK JP";}];
        emojis = [{family = "Noto Color Emoji";}];
      };
      navigation.mode = "toptab";
      padding-x = 5;
      padding-y = [7 3];
      renderer.performance = "high";
      scroll = {
        multiplier = 10.0;
        divider = 0.5;
      };
      window.opacity = 0.9;
      bindings.keys = [
        {
          key = "pageup";
          "with" = "control | shift";
          action = "MoveCurrentTabToPrev";
        }
        {
          key = "pagedown";
          "with" = "control | shift";
          action = "MoveCurrentTabToNext";
        }
      ];
    };
  };
}
