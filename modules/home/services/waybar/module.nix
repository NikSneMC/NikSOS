{
  config,
  lib,
  lib',
  options,
  osConfig,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.theme) colors;

  cfg = config.modules.services.waybar;

  attrsForHost = host: lib'.forHosts osConfig [host] lib.optionalAttrs;
in {
  options.modules.services.waybar = {
    enable = options.services.waybar.enable;
  };

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings = [
        {
          name = "left-bar";
          layer = "top";
          position = "left";
          width = 60;
          margin-top = 9;
          margin-bottom = 9;
          modules-left = [
            "niri/workspaces"
          ];
          modules-center = [
            "cpu"
            "memory"
            "disk"
            "temperature"
            "clock#time"
            "clock#calendar"
            "battery"
            "backlight"
            "pulseaudio#output"
            "pulseaudio#input"
          ];
          modules-right = [
            "group/misc"
            "tray"
            "custom/media"
            "network"
            "niri/language"
          ];

          "niri/workspaces" = {
            format = "{icon}";
            format-icons = let
              icons = [
                ""
                ""
                "󱛉"
                "󰭻"
                "󰊗"
                ""
              ];
              named =
                config.programs.niri.settings.workspaces
                |> builtins.attrValues
                |> map (ws: ws.name)
                |> lib.zipLists icons
                |> map ({
                  fst,
                  snd,
                }:
                  lib.nameValuePair snd fst)
                |> builtins.listToAttrs;
            in
              named
              // {
                default = "";
              };
          };

          cpu = {
            interval = 1;
            format = "󰻠{usage}%";
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
            format = "{percentage}%";
            tooltip-format = ''              Main: ({used} GiB/{total} GiB)({percentage}%,) available {avail} GiB
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
            format = "󰋊{percentage_used}%";
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
              format = "{icon}{temperatureC}󰔄";
              # "format-critical" = "🔥{icon} {temperatureC}󰔄";
              format-icons = [
                ""
                ""
                ""
                ""
                ""
              ];
            }
            // (attrsForHost "nakama" {
              hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon6/temp1_input";
            });
          "clock#time" = {
            interval = 1;
            format = "{:%H:%M}";
            tooltip-format = "{:%H:%M:%S}";
          };
          "clock#calendar" = {
            format = "{:%d-%m}";
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
              format = with colors; {
                months = "<span color='#${rosewater}'><b>{}</b></span>";
                days = "<span color='#${text}'><b>{}</b></span>";
                weeks = "<span color='#${mauve}'><b>W{}</b></span>";
                weekdays = "<span color='#${green}'><b>{}</b></span>";
                today = "<span color='#${teal}'><b><u>{}</u></b></span>";
              };
            };
          };
          battery = {
            interval = 1;
            states = {
              high = 90;
              upper-medium = 70;
              medium = 50;
              lower-medium = 30;
              low = 10;
            };
            format = "{icon}{capacity}%";
            format-charging = "󰂄{capacity}%";
            format-plugged = "󰚥{capacity}%";
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
            reverse-scrolling = true;
            format = "{icon}{percent}%";
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
            format = "{icon}{volume}%";
            format-bluetooth = "󰂱{icon}{volume}%";
            format-bluetooth-muted = "󰂱󰝟{volume}%";
            format-muted = "󰝟{volume}%";
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
            on-click-right = "pavucontrol";
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
            format-source = "󰍬{volume}%";
            format-source-muted = "󰍭{volume}%";
            on-click = "pamixer --default-source -t";
            on-click-right = "pavucontrol";
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
            tooltip-format-activated = "idle-inhibitor <span color='#${colors.green}'>on</span>";
            tooltip-format-deactivated = "idle-inhibitor <span color='#${colors.maroon}'>off</span>";
            start-activated = true;
          };
          tray = {
            icon-size = 20;
            spacing = 2;
          };
          "custom/media" = {
            format = "{icon}";
            restart-interval = 2;
            return-type = "json";
            format-icons = {
              "Playing" = "";
              "Paused" = "";
            };
            max-length = 40;
            exec = "fish -c \"fetch_music_player_data -w\"";
            on-click = "playerctl play-pause";
            on-click-right = "playerctl next";
            on-click-middle = "playerctl previous";
            on-scroll-up = "playerctl volume 0.05+";
            on-scroll-down = "playerctl volume 0.05-";
            smooth-scrolling-threshold = "0.1";
            reverse-scrolling = true;
          };
          network = {
            interval = 1;
            format = "󰤭";
            format-wifi = "{icon}";
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format-disconnected = "󰤫";
            tooltip-format = "wifi <span color='#${colors.maroon}'>off</span>";
            tooltip-format-wifi = with colors; ''
              SSID = {essid}({signalStrength}%), {frequency} MHz
              Interface = {ifname}
              IP = {ipaddr}
              GW = {gwaddr}

              <span color='#${green}'>{bandwidthUpBits}</span>\t<span color='#${maroon}'>{bandwidthDownBits}</span>\t<span color='#${mauve}'>󰹹{bandwidthTotalBits}</span>
            '';
            tooltip-format-disconnected = "<span color='#${colors.red}'>disconnected</span>";
            format-ethernet = "󰈀";
            format-linked = "󰈀!";
            tooltip-format-ethernet = with colors; ''              Interface = {ifname}
              IP = {ipaddr}
              GW = {gwaddr}
              Netmask = {netmask}
              CIDR = {cidr}

              <span color='#${green}'>{bandwidthUpBits}</span> <span color='#${maroon}'>{bandwidthDownBits}</span> <span color='#${mauve}'>󰹹{bandwidthTotalBits}</span>'';
            max-length = 35;
            on-click = "fish -c toggle_wifi";
            on-click-right = "nm-connection-editor";
          };
          "niri/language" = {
            format- = "ENG";
            format-ru = "RUS";
          };
        }
      ];
      style =
        # css
        ''
          @define-color accent @${config.theme.accent};

          ${builtins.readFile ./style.css}
        '';
    };
  };
}
