{
  config,
  lib',
  ...
}: {
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl reboot --firmware-setup";
        text = "Reboot to BIOS";
        keybind = "b";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "fish -c suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = ''
      @import "${config.catppuccin.sources.waybar}/themes/${config.theme.flavor}.css";
      @define-color accent @${config.theme.accent};

      ${builtins.readFile ./style.css}

      ${lib'.wlogout.mkBgImageCss config [
        "lock"
        "logout"
        "suspend"
        "hibernate"
        "shutdown"
        "reboot"
      ]}
    '';
  };
}
