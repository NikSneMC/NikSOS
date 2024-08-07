{
  config,
  pkgs,
  lib,
  theme,
  ...
}: let
  palette = theme."${config.theme.flavor}";
  bgImageSection = name: ''
    #${name} {
      background-image: url("${pkgs.wlogout}/share/wlogout/icons/${name}.png");

    }
  '';
in {
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
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
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
      * {
        background-image: none;
      }
  
      window {
        background-color: alpha(${palette.palette.base}, 0.9);
      }
  
      button {
        margin: 8px;
        color: ${palette.palette.text};
        background-color: ${palette.palette.surface0};
        border-style: solid;
        border-width: 2px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 15%;
      }
  
      button:active,
      button:focus,
      button:hover {
      color: ${palette.palette.${config.theme.accent}};
        background-color: ${palette.palette.base};
        outline-style: none;
      }
  
      ${lib.concatMapStringsSep "\n" bgImageSection [
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
