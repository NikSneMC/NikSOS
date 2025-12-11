{
  programs.niri.settings.input = {
    focus-follows-mouse.enable = false;

    keyboard = {
      xkb = {
        layout = "us, ru";
        options = "grp:win_space_toggle, compose:ralt";
      };
      numlock = true;
      track-layout = "window";
    };

    mod-key = "Super";
    mod-key-nested = "Alt";

    warp-mouse-to-focus = {
      enable = true;
      mode = "center-xy";
    };
  };
}
