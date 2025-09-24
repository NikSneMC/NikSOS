{config, ...}: {
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
        action = "hyprlock & sleep 1 && niri msg action power-off-monitors";
        text = "Lock & screen off";
        keybind = "d";
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
  };
  catppuccin.wlogout.extraStyle =
    # css
    ''
      @define-color surface0 #${config.theme.colors.surface0};

      button {
          background-color: alpha(@surface0, 0.9);
      }
    '';
}
