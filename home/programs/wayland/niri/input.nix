{
  programs.niri.settings.input = {
    focus-follows-mouse.enable = false;

    keyboard = {
      numlock = true;
      track-layout = "window";
      xkb = {
        layout = "us, ru";
        variant = "dvp";
        options = "grp:win_space_toggle, compose:ralt, caps:ctrl_modifier";
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
