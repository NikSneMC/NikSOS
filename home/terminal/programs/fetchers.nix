{pkgs, ...}: {
  home.packages = with pkgs; [
    onefetch
    cpufetch
    tokei
  ];

  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
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
          keyColor = "green";
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
          key = "├─ Terminal     ";
          keyColor = "green";
          type = "terminal";
        }
        {
          key = "├─ Terminal Font";
          keyColor = "yellow";
          type = "terminalfont";
        }
        {
          key = "├─ WM           ";
          keyColor = "blue";
          type = "wm";
        }
        {
          key = "├─󰭠 WM Theme     ";
          keyColor = "magenta";
          type = "wmtheme";
        }
        {
          key = "├─󱕕 Theme        ";
          keyColor = "cyan";
          type = "theme";
        }
        {
          key = "├─󱁹 Icons        ";
          keyColor = "white";
          type = "icons";
        }
        {
          key = "├─ Font         ";
          keyColor = "red";
          type = "font";
        }
        {
          key = "╰─󰇀 Cursor       ";
          keyColor = "yellow";
          type = "cursor";
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
          format = "{2} - {1} [{3}, {4}, {7}] {10}";
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
          key = "├─󰂀 Battery      ";
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
          format = "{1} {2} [{6}] ({3})";
          key = "├─ GPU          ";
          keyColor = "green";
          temp = {
            green = 40;
            yellow = 60;
          };
          type = "gpu";
        }
        {
          format = "{6} - {1}x{2}@{3}Hz (as {4}x{5})";
          key = "├─ Display      ";
          keyColor = "yellow";
          order = "desc";
          preciseRefreshRate = false;
          type = "display";
        }
        {
          format = "{1} - {3} ({4})";
          key = "├─ Bluetooth    ";
          keyColor = "blue";
          percent = {
            green = 50;
            yellow = 80;
          };
          type = "bluetooth";
        }
        {
          key = "╰─ Swap         ";
          keyColor = "magenta";
          percent = {
            green = 50;
            yellow = 80;
          };
          type = "swap";
        }
        "break"
        "colors"
      ];
    };
  };
}
