{
  programs.niri.settings.input = {
    focus-follows-mouse.enable = true;

    keyboard = {
      numlock = true;
      track-layout = "window";
      xkb = {
        layout = "us, ru";
        options = "grp:win_space_toggle, compose:ralt";
      };
    };

    mod-key = "Super";
    mod-key-nested = "Alt";

    warp-mouse-to-focus = {
      enable = true;
      mode = "center-xy";
    };
  };
}
