{
  config,
  pkgs,
  lib,
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

    style = let
      iconFile = name:
        builtins.toFile "wlogout-${name}-icon.svg" (let
          lines = builtins.filter (l: builtins.isString l) (builtins.split "\n" (builtins.readFile "${pkgs.wlogout}/share/wlogout/assets/${name}.svg"));
        in ''
          ${builtins.elemAt lines 0}
          ${builtins.elemAt lines 3}
          <defs><style type="text/css"><![CDATA[
              path {
                 fill: #${config.theme.colors.accent};
              }
          ]]></style></defs>
          ${builtins.elemAt lines 5}
          ${builtins.elemAt lines 6}
        '');
      bgImageSection = name: ''
        #${name} {
          background-image: image(url("${iconFile name}"));
        }
      '';
    in ''
      @import "${config.catppuccin.sources.waybar}/themes/${config.theme.flavor}.css";
      @define-color accent @${config.theme.accent};

      ${builtins.readFile ./style.css}

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
