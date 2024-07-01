{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    cpufetch
  ];

  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        type = "iterm";
        source = let
          url = "https://raw.githubusercontent.com/NikSneMC/NikSOS/assets/logo_nixos.png";
          sha256 = "1qs61nbhh624zbpak639gfj96wg7krpqp0qp70943zsl2j9dfrl9";
          filename = lib.last (lib.splitString "/" url);
        in
          builtins.fetchurl {
            name = "${sha256}-fastfetch-${filename}";
            inherit url sha256;
          };
        width = 35;
      };
      modules = [
        "title"
        "separator"
        {
          type = "os";
          key = " OS";
          keyColor = "red";
          format = "{3} {12}";
        }
        {
          type = "host";
          key = "󰌢 Host";
          keyColor = "green";
        }
        {
          type = "kernel";
          key = " Kernel";
          keyColor = "yellow";
        }
        {
          type = "uptime";
          key = "↑ Uptime";
          keyColor = "blue";
        }
        {
          type = "shell";
          key = " Shell";
          keyColor = "magenta";
          format = "{6} {4}";
        }
        {
          type = "packages";
          key = " Packages";
          keyColor = "cyan";
        }
        {
          type = "locale";
          key = " Locale";
          keyColor = "white";
        }
        {
          type = "de";
          key = "󰨇 DE";
          keyColor = "red";
        }
        {
          type = "wm";
          key = " WM";
          keyColor = "green";
        }
        {
          type = "terminal";
          key = " Terminal";
          keyColor = "yellow";
        }
        "break"
        {
          type = "cpu";
          key = " CPU";
          keyColor = "blue";
          temp = true;
        }
        {
          type = "board";
          key = "󰚗 Board";
          keyColor = "magenta";
          format = "{2} {1} ({3})";
        }
        {
          type = "bios";
          key = " BIOS";
          keyColor = "cyan";
          format = "{3} {5} {2} ({1})";
        }
        {
          type = "memory";
          key = " Memory";
          keyColor = "white";
          percent = {
            green = 50;
            yellow = 80;
          };
        }
        {
          type = "swap";
          key = " Swap";
          keyColor = "red";
          percent = {
            green = 50;
            yellow = 80;
          };
        }
        {
          type = "physicaldisk";
          key = "󰋊 Disk";
          keyColor = "green";
          temp = {
            green = 45;
            yellow = 60;
          };
          format = "{2} - {1} [{3}, {4}, {7}] ({5}) {10}";
        }
        {
          type = "disk";
          key = "󰋊 Disk";
          keyColor = "yellow";
          percent = {
            green = 60;
            yellow = 85;
          };
          format = "{10} - {1} / {2} ({3})";
        }
        {
          type = "battery";
          key = "󰂀 Battery";
          keyColor = "blue";
          temp = {
            green = 40;
            yellow = 60;
          };
          percent = {
            green = 60;
            yellow = 20;
          };
        }
        {
          type = "wifi";
          key = " WiFi";
          keyColor = "magenta";
          format = "{4} - {10} ({7})";
        }
        {
          type = "gpu";
          key = " GPU";
          keyColor = "cyan";
          temp = {
            green = 40;
            yellow = 60;
          };
          format = "{1} {2} [{6}] ({3})";
        }
        {
          type = "display";
          key = " Display";
          keyColor = "white";
          preciseRefreshRate = false;
          order = "desc";
          format = "{6} - {1}x{2}@{3}Hz (as {4}x{5})";
        }
        {
          type = "bluetooth";
          key = " Bluetooth";
          keyColor = "red";
          percent = {
            green = 50;
            yellow = 80;
          };
          format = "{1} - {3} ({4})";
        }
        "break"
        {
          type = "terminalfont";
          key = " Terminal Font";
          keyColor = "green";
        }
        {
          type = "wmtheme";
          key = "󰭠 WM Theme";
          keyColor = "yellow";
        }
        {
          type = "theme";
          key = "󱕕 Theme";
          keyColor = "blue";
        }
        {
          type = "icons";
          key = "󱁹 Icons";
          keyColor = "magenta";
        }
        {
          type = "font";
          key = " Font";
          keyColor = "cyan";
        }
        {
          type = "cursor";
          key = "󰇀 Cursor";
          keyColor = "white";
        }
        {
          type = "player";
          key = " Media Player";
          keyColor = "red";
        }
        {
          type = "media";
          key = " Media";
          keyColor = "green";
          format = "{3} - {1} {4}";
        }
        "break"
        "colors"
      ];
    };
  };
}
