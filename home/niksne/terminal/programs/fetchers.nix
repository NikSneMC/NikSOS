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
          sha256 = "07r8ms25l0xsr7hadx80z97ivrryrn17sf6flm5i92ark3xr61ay";
          filename = lib.last (lib.splitString "/" url);
        in
          builtins.fetchurl {
            name = "${sha256}-fastfetch-${filename}";
            inherit url sha256;
          };
        width = 35;
      };
      display = {
        separator = " │ ";
      };
      modules = [
        "title"
        {
          type = "separator";
          string = "─";
        }
        {
          format = "{3} {12}";
          key = "╭─ OS           ";
          keyColor = "red";
          type = "os";
        }
        {
          key = "├─󰌢 Host         ";
          keyColor = "red";
          type = "host";
        }
        {
          key = "├─ Kernel       ";
          keyColor = "yellow";
          type = "kernel";
        }
        {
          key = "├─↑ Uptime       ";
          keyColor = "blue";
          type = "uptime";
        }
        {
          format = "{6} {4}";
          key = "├─ Shell        ";
          keyColor = "magenta";
          type = "shell";
        }
        {
          key = "├─ Packages     ";
          keyColor = "cyan";
          type = "packages";
        }
        {
          key = "├─ Locale       ";
          keyColor = "white";
          type = "locale";
        }
        {
          key = "├─󰨇 DE           ";
          keyColor = "red";
          type = "de";
        }
        {
          key = "├─ WM           ";
          keyColor = "green";
          type = "wm";
        }
        {
          key = "╰─ Terminal     ";
          keyColor = "yellow";
          type = "terminal";
        }
        {
          key = "╭─ CPU          ";
          keyColor = "red";
          temp = true;
          type = "cpu";
        }
        {
          format = "{2} {1} ({3})";
          key = "├─󰚗 Board        ";
          keyColor = "green";
          type = "board";
        }
        {
          format = "{3} {5} {2} ({1})";
          key = "├─ BIOS         ";
          keyColor = "blue";
          type = "bios";
        }
        {
          key = "├─ Memory       ";
          keyColor = "magenta";
          percent = {
            green = 50;
            yellow = 80;
          };
          type = "memory";
        }
        {
          format = "{2} - {1} [{3}, {4}, {7}] ({5}) {10}";
          key = "├─󰋊 Drive        ";
          keyColor = "cyan";
          temp = {
            green = 45;
            yellow = 60;
          };
          type = "physicaldisk";
        }
        {
          format = "{10} - {1} / {2} ({3})";
          key = "├─󰋊 Disk         ";
          keyColor = "white";
          percent = {
            green = 60;
            yellow = 85;
          };
          type = "disk";
        }
        {
          key = "├─󰂀 Battery     ";
          keyColor = "red";
          percent = {
            green = 60;
            yellow = 20;
          };
          temp = {
            green = 40;
            yellow = 60;
          };
          type = "battery";
        }
        {
          format = "{4} - {10} ({7})";
          key = "├─ WiFi         ";
          keyColor = "green";
          type = "wifi";
        }
        {
          format = "{1} {2} [{6}] ({3})";
          key = "├─ GPU          ";
          keyColor = "yellow";
          temp = {
            green = 40;
            yellow = 60;
          };
          type = "gpu";
        }
        {
          format = "{6} - {1}x{2}@{3}Hz (as {4}x{5})";
          key = "├─ Display      ";
          keyColor = "blue";
          order = "desc";
          preciseRefreshRate = false;
          type = "display";
        }
        {
          format = "{1} - {3} ({4})";
          key = "├─ Bluetooth    ";
          keyColor = "magenta";
          percent = {
            green = 50;
            yellow = 80;
          };
          type = "bluetooth";
        }
        {
          key = "╰─ Swap         ";
          keyColor = "cyan";
          percent = {
            green = 50;
            yellow = 80;
          };
          type = "swap";
        }
        {
          key = "╭─ Terminal Font";
          keyColor = "red";
          type = "terminalfont";
        }
        {
          key = "├─󰭠 WM Theme     ";
          keyColor = "green";
          type = "wmtheme";
        }
        {
          key = "├─󱕕 Theme        ";
          keyColor = "yellow";
          type = "theme";
        }
        {
          key = "├─󱁹 Icons        ";
          keyColor = "blue";
          type = "icons";
        }
        {
          key = "├─ Font         ";
          keyColor = "magenta";
          type = "font";
        }
        {
          key = "├─ Media Player ";
          keyColor = "cyan";
          type = "player";
        }
        {
          format = "{3} - {1} {4}";
          key = "├─ Media        ";
          keyColor = "white";
          type = "media";
        }
        {
          key = "╰─󰇀 Cursor       ";
          keyColor = "red";
          type = "cursor";
        }
        "break"
        "colors"
      ];
    };
  };
}
