{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    catppuccin.enable = true;
    settings = [
      {
        name = "top_bar";
        layer = "top";
        position = "top";
        height = 46;
        spacing = 4;
        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock#time"
          "custom/separator"
          "clock#week"
          "custom/separator"
          "clock#calendar"
        ];
        modules-right = [
          "bluetooth"
          "network"
          "hyprland/language"
        ];
        "custom/launcher" = {
          format = " ";
          on-click = "rofi -show drun";
          on-click-right = "wlogout";
          tooltip = false;
        };
        "hyprland/workspaces" = {
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          format = "{icon}";
          format-icons = {
            "1" = "󰲠";
            "2" = "󰲢";
            "3" = "󰲤";
            "4" = "󰲦";
            "5" = "󰲨";
            "6" = "󰲪";
            "7" = "󰲬";
            "8" = "󰲮";
            "9" = "󰲰";
            "10" = "󰿬";
            "11" = "";
            "12" = "";
            "13" = "";
            "14" = "";
            "15" = "󰙯";
            "16" = "";
            "17" = "";
            "18" = "";
            "19" = "󰕃";
            "20" = "󰆧";
            "21" = "󰍳";
            "22" = "";
          };
        };
        "clock#time" = {
          interval = 1;
          format = "{:%H:%M:%S}";
        };
        "custom/separator" = {
          format = "|";
        };
        "clock#week" = {
          format = "{:%a}";
          locale = "en_US.UTF-8";
        };
        "clock#calendar" = {
          format = "{:%d-%m-%Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#${config.theme.colors.rosewater}'><b>{}</b></span>";
              days = "<span color='#${config.theme.colors.text}'><b>{}</b></span>";
              weeks = "<span color='#${config.theme.colors.mauve}'><b>W{}</b></span>";
              weekdays = "<span color='#${config.theme.colors.green}'><b>{}</b></span>";
              today = "<span color='#${config.theme.colors.teal}'><b><u>{}</u></b></span>";
            };
          };
        };
        bluetooth = {
          format = "󰂯";
          format-disabled = "󰂲";
          format-connected = "󰂱 {device_alias}";
          format-connected-battery = "󰂱 {device_alias} (󰥉 {device_battery_percentage}%)";
          tooltip-format = ''            {controller_alias}\t{controller_address} ({status})

            {num_connections} connected'';
          tooltip-format-disabled = "bluetooth off";
          tooltip-format-connected = ''            {controller_alias}\t{controller_address} ({status})

            {num_connections} connected\n\n{device_enumerate}'';
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t({device_battery_percentage}%)";
          max-length = 35;
          on-click = "fish -c toggle_bluetooth";
          on-click-right = "blueman-manager";
        };
        network = {
          interval = 1;
          format = "󰤭";
          format-wifi = "{icon} ({signalStrength}%){essid}";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-disconnected = "󰤫  Disconnected";
          tooltip-format = "wifi <span color='#${config.theme.colors.maroon}'>off</span>";
          tooltip-format-wifi = ''
            SSID = {essid}({signalStrength}%), {frequency} MHz
            Interface = {ifname}
            IP = {ipaddr}
            GW = {gwaddr}

            <span color='#${config.theme.colors.green}'>{bandwidthUpBits}</span>\t<span color='#${config.theme.colors.maroon}'>{bandwidthDownBits}</span>\t<span color='#${config.theme.colors.mauve}'>󰹹{bandwidthTotalBits}</span>
          '';
          tooltip-format-disconnected = "<span color='#${config.theme.colors.red}'>disconnected</span>";
          format-ethernet = "󰈀 {ipaddr}/{cidr}";
          format-linked = "󰈀 {ifname} (No IP)";
          tooltip-format-ethernet = ''            Interface = {ifname}
            IP = {ipaddr}
            GW = {gwaddr}
            Netmask = {netmask}
            CIDR = {cidr}

            <span color='#${config.theme.colors.green}'>{bandwidthUpBits}</span> <span color='#${config.theme.colors.maroon}'>{bandwidthDownBits}</span> <span color='#${config.theme.colors.mauve}'>󰹹{bandwidthTotalBits}</span>'';
          max-length = 35;
          on-click = "fish -c toggle_wifi";
          on-click-right = "nm-connection-editor";
        };
        "hyprland/language" = {
          format-en = "ENG";
          format-ru = "RUS";
          on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
          on-click-right = "hyprctl switchxkblayout at-translated-set-2-keyboard prev";
        };
      }
      {
        name = "bottom_bar";
        layer = "top";
        position = "bottom";
        height = 36;
        spacing = 4;
        modules-left = [
          "user"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "custom/weather"
          "custom/media"
        ];
        user = {
          format = "<span color='#${config.theme.colors.${config.theme.accent}}'> {user}</span> (up <span color='#${config.theme.colors.pink}'>{work_d} d</span> <span color='#${config.theme.colors.blue}'>{work_H} h</span> <span color='#${config.theme.colors.red}'>{work_M} min</span> <span color='#${config.theme.colors.green}'>↑</span>)";
          icon = true;
        };
        "hyprland/window" = {
          format = "{title} ({class})";
          max-length = 75;
          separate-outputs = true;
        };
        "custom/weather" = {
          format = "{}°";
          interval = 600;
          exec = "${lib.getExe pkgs.wttrbar} --date-format \"%d-%m-%Y\"";
          return-type = "json";
        };
        "custom/media" = {
          format = "{icon}  {}";
          restart-interval = 2;
          return-type = "json";
          format-icons = {
            "Playing" = "";
            "Paused" = "";
          };
          max-length = 40;
          exec = "fish -c fetch_music_player_data_colored";
          on-click = "playerctl play-pause";
          on-click-right = "playerctl next";
          on-click-middle = "playerctl prev";
          on-scroll-up = "playerctl volume 0.05+";
          on-scroll-down = "playerctl volume 0.05-";
          smooth-scrolling-threshold = "0.1";
          reverse-scrolling = true;
        };
      }
      {
        name = "left_bar";
        layer = "top";
        position = "left";
        spacing = 4;
        width = 60;
        margin-top = 9;
        margin-bottom = 9;
        modules-left = [
          "wlr/taskbar"
        ];
        modules-center = [
          "cpu"
          "memory"
          "disk"
          "temperature"
          "battery"
          "backlight"
          "pulseaudio#output"
          "pulseaudio#input"
        ];
        modules-right = [
          "group/misc"
          "tray"
        ];
        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 20;
          icon-theme = "Numix-Circle";
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-right = "close";
          on-click-middle = "fullscreen";
        };
        cpu = {
          interval = 1;
          format = "󰻠 {usage}%";
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "mission-center";
        };
        memory = {
          interval = 1;
          format = " {percentage}%";
          tooltip-format = ''            Main: ({used} GiB/{total} GiB)({percentage}%,) available {avail} GiB
            Swap: ({swapUsed} GiB/{swapTotal} GiB)({swapPercentage}%), available {swapAvail} GiB'';
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "mission-center";
        };
        disk = {
          format = "󰋊 {percentage_used}%";
          tooltip-format = "({used}/{total})({percentage_used}%) in '{path}', available {free}({percentage_free}%)";
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "mission-center";
        };
        temperature =
          {
            interval = 1;
            tooltip = false;
            critical-threshold = 90;
            format = "{icon} {temperatureC}󰔄";
            # "format-critical" = "🔥{icon} {temperatureC}󰔄";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
          }
          // (
            if config.home.host == "laptop-niksne"
            then {
              hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon6/temp1_input";
            }
            else {}
          );
        battery = {
          interval = 1;
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-time = "{H} h {M} min";
          format-icons = [
            "󱃍"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          tooltip-format = "{timeTo}";
        };
        backlight = {
          format = "{icon} {percent}%";
          format-icons = [
            "󰌶"
            "󱩎"
            "󱩏"
            "󱩐"
            "󱩑"
            "󱩒"
            "󱩓"
            "󱩔"
            "󱩕"
            "󱩖"
            "󰛨"
          ];
          tooltip = false;
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
        };
        "pulseaudio#output" = {
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          tooltip-format = "{desc}";
          format = "{icon} {volume}%";
          format-bluetooth = "󰂱{icon} {volume}%";
          format-bluetooth-muted = "󰂱󰝟 {volume}%";
          format-muted = "󰝟 {volume}%";
          format-icons = {
            headphone = "󰋋";
            hands-free = "";
            headset = "󰋎";
            phone = "󰄜";
            portable = "󰦧";
            car = "󰄋";
            speaker = "󰓃";
            hdmi = "󰡁";
            hifi = "󰋌";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pamixer -t";
          on-click-right = "pypr toggle volume";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          reverse-scrolling = true;
          scroll-step = 1;
        };
        "pulseaudio#input" = {
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          tooltip-format = "{desc}";
          format = "{format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭 {volume}%";
          on-click = "pamixer --default-source -t";
          on-click-right = "pypr toggle volume";
          on-scroll-up = "pamixer --default-source -i 1";
          on-scroll-down = "pamixer --default-source -d 1";
          reverse-scrolling = true;
          scroll-step = 1;
        };
        "group/misc" = {
          orientation = "vertical";
          modules = [
            "pulseaudio#microphone_indicator"
            "custom/recording"
            # "custom/github";
            "custom/notifications"
            "custom/night_mode"
            "custom/airplane_mode"
            "idle_inhibitor"
          ];
        };
        "pulseaudio#microphone_indicator" = {
          format = "{format_source}";
          format-source = "󰍬";
          format-source-muted = "";
          tooltip-format = "microphone on";
        };
        "custom/recording" = {
          interval = 1;
          exec-if = "pgrep wf-recorder";
          exec = "fish -c check_recording";
          return-type = "json";
        };
        "custom/github" = {
          format = "  {}";
          return-type = "json";
          interval = 1;
          exec = "~/.config/waybar/scripts/github.sh";
          on-click = "xdg-open https://github.com/notifications";
        };
        "custom/notifications" = {
          return-type = "json";
          exec = "fish -c notifications";
          on-click = "swaync-client -t";
          on-click-middle = "swaync-client -C";
          on-click-right = "swaync-client -d";
          restart-interval = 1;
        };
        "custom/night_mode" = {
          return-type = "json";
          interval = 1;
          exec = "fish -c check_night_mode";
          on-click = "fish -c toggle_night_mode";
        };
        "custom/airplane_mode" = {
          return-type = "json";
          interval = 1;
          exec = "fish -c check_airplane_mode";
          on-click = "fish -c toggle_airplane_mode";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰛐";
            deactivated = "󰛑";
          };
          tooltip-format-activated = "idle-inhibitor <span color='#${config.theme.colors.green}'>on</span>";
          tooltip-format-deactivated = "idle-inhibitor <span color='#${config.theme.colors.maroon}'>off</span>";
          start-activated = true;
        };
        tray = {
          icon-size = 20;
          spacing = 2;
        };
      }
    ];
    style = ''
      * {
        border: none;
      }



      window.top_bar#waybar {
        background-color: alpha(@base, 0.7);
        border-bottom: solid alpha(@surface1, 0.7) 2px;
      }


      window.top_bar .modules-left {}

      #custom-launcher {
        color: @blue;
        background-color: alpha(@surface1, 0.7);
        border-radius: 0 15px 15px 0;
        padding-left: 10px;
        padding-right: 10px;
        margin-top: 5px;
        margin-bottom: 5px;
        font-size: 20px;
      }

      #workspaces {
        margin-left: 10px;
      }

      #workspaces button.active {
        color: @${config.theme.accent};
      }

      #workspaces button.urgent {
        color: @peach;
      }

      #workspaces button {
        color: @text;
        font-size: 25px;
      }


      window.top_bar .modules-center {
        font-weight: bold;
        background-color: alpha(@surface1, 0.7);
        color: @peach;
        border-radius: 15px;
        padding-left: 20px;
        padding-right: 20px;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #clock.time {
        color: @flamingo;
      }

      #custom-separator {
        color: @teal;
      }

      #clock.week {
        color: @sapphire;
      }

      #clock.calendar {
        color: @mauve;
      }


      window.top_bar .modules-right {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15px 0 0 15px;
        padding-left: 20px;
        padding-right: 20px;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #network {
        padding-left: 10px;
      }

      #network.disabled {
        background-color: alpha(@surface1, 0.7);
        color: @subtext0;
      }

      #network.disconnected {
        background-color: alpha(@surface1, 0.7);
        color: @red;
      }

      #network.wifi , #network.ethernet {
        color: @${config.theme.accent};
      }

      #keyboard-state label.locked {
        color: @yellow;
      }

      #keyboard-state label {
        color: @subtext0;
      }

      #keyboard-state, #language {
        padding-left: 5px;
      }



      window.bottom_bar#waybar {
        background-color: alpha(@base, 0.7);
        border-top: solid alpha(@surface1, 0.7) 2px;
      }


      window.bottom_bar .modules-left {
        background-color: alpha(@surface1, 0.7);
        border-radius: 0 15px 15px 0;
        padding-left: 20px;
        padding-right: 20px;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #user {
        padding-left: 10px;
      }


      window.bottom_bar .modules-center {
        background-color: alpha(@surface1, 0.7);
        color: @${config.theme.accent};
        border-radius: 15px;
        padding-left: 20px;
        padding-right: 20px;
        margin-top: 5px;
        margin-bottom: 5px;
      }


      window.bottom_bar .modules-right {
        background-color: alpha(@surface1, 0.7);
        border-radius: 15px 0 0 15px;
        padding-left: 20px;
        padding-right: 20px;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #custom-media {
        padding-left: 10px;
      }

      #custom-media.Paused {
        color: @subtext0;
      }



      window.left_bar#waybar {
        background-color: alpha(@base, 0.7);
        border-top: solid alpha(@surface1, 0.7) 2px;
        border-right: solid alpha(@surface1, 0.7) 2px;
        border-bottom: solid alpha(@surface1, 0.7) 2px;
        border-radius: 0 15px 15px 0;
      }


      window.top_bar .modules-left {}

      #taskbar {
        margin-top: 10px;
        margin-right: 10px;
        margin-left: 10px;
      }

      #taskbar button.active {
        background-color: alpha(@surface1, 0.7);
        border-radius: 10px;
      }


      window.left_bar .modules-center {
        background-color: alpha(@surface1, 0.7);
        border-radius: 0 15px 15px 0;
        margin-right: 5px;
        margin-top: 15px;
        margin-bottom: 15px;
        padding-top: 5px;
        padding-bottom: 5px;
      }

      #cpu {
        color: @sapphire;
      }

      #cpu.low {
        color: @rosewater;
      }

      #cpu.lower-medium {
        color: @yellow;
      }

      #cpu.medium {
        color: @peach;
      }

      #cpu.upper-medium {
        color: @maroon;
      }

      #cpu.high {
        color: @red;
      }

      #memory {
        color: @sapphire;
      }

      #memory.low {
        color: @rosewater;
      }

      #memory.lower-medium {
        color: @yellow;
      }

      #memory.medium {
        color: @peach;
      }

      #memory.upper-medium {
        color: @maroon;
      }

      #memory.high {
        color: @red;
      }

      #disk {
        color: @sapphire;
      }

      #disk.low {
        color: @rosewater;
      }

      #disk.lower-medium {
        color: @yellow;
      }

      #disk.medium {
        color: @peach;
      }

      #disk.upper-medium {
        color: @maroon;
      }

      #disk.high {
        color: @red;
      }

      #temperature {
        color: @green;
      }

      #temperature.critical {
        color: @red;
      }

      #battery {
        color: @teal;
      }

      #battery.low {
        color: @red;
      }

      #battery.lower-medium {
        color: @maroon;
      }

      #battery.medium {
        color: @peach;
      }

      #battery.upper-medium {
        color: @flamingo;
      }

      #battery.high {
        color: @rosewater;
      }

      #backlight {
        color: @overlay0;
      }

      #backlight.low {
        color: @overlay1;
      }

      #backlight.lower-medium {
        color: @overlay2;
      }

      #backlight.medium {
        color: @subtext0;
      }

      #backlight.upper-medium {
        color: @subtext1;
      }

      #backlight.high {
        color: @text;
      }

      #pulseaudio.bluetooth {
        color: @sapphire;
      }

      #pulseaudio.muted {
        color: @surface2;
      }

      #pulseaudio {
        color: @text;
      }

      #pulseaudio.low {
        color: @overlay0;
      }

      #pulseaudio.lower-medium {
        color: @overlay1;
      }

      #pulseaudio.medium {
        color: @overlay2;
      }

      #pulseaudio.upper-medium {
        color: @subtext0;
      }

      #pulseaudio.high {
        color: @subtext1;
      }


      window.top_bar .modules-right {}

      #custom-recording {
        color: @red;
        margin-right: 4px;
      }

      #custom-geo {
        color: @yellow;
        margin-right: 4px;
      }

      #custom-notifications.off {
        color: @subtext0;
      }

      #custom-night_mode.off {
        color: @subtext0;
      }

      #custom-airplane_mode.off {
        color: @subtext0;
      }

      #idle_inhibitor.deactivated {
        color: @subtext0;
      }

      #custom-recording, #custom-geo, #custom-github, #custom-mako, #custom-night_mode, #custom-airplane_mode, #idle_inhibitor {
        padding-left: 1px;
        padding-right: 5px;
        margin-top: 2.5px;
        margin-bottom: 2.5px;
      }

      #tray {
        margin-bottom: 10px;
        margin-right: 10px;
        margin-left: 10px;
      }

      #tray>.needs-attention {
        background-color: alpha(@maroon, 0.7);
        border-radius: 10px;
      }
    '';
  };
}
