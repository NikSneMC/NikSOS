{config, ...}: {
  imports = [
    ./layouts.nix
  ];

  console.useXkbConfig = true;

  services.xserver.xkb = {
    layout = "rdvp, ru";
    options = "grp:win_space_toggle, compose:ralt";
  };

  environment.variables = {
    XKB_DEFAULT_LAYOUT = config.services.xserver.xkb.layout;
    XKB_DEFAULT_VARIANT = config.services.xserver.xkb.variant;
  };
}
