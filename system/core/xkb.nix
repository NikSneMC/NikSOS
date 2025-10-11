{
  console.useXkbConfig = true;

  services.xserver.xkb = {
    layout = "us, ru";
    variant = "dvp";
    options = "grp:win_space_toggle, compose:ralt, caps:ctrl_modifier";
  };
}
