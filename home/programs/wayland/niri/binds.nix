{
  config,
  inputs,
  lib,
  lib',
  pkgs,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    inherit (lib'.niri) mkBinds mkWorkspacesBinds mkColumnsBinds;

    fish = spawn "fish" "-c";
    rofi = menu: fish "pkill -9 bin/rofi || rofi -show ${menu}";
    packages = builtins.mapAttrs (_: lib.getExe) {
      activate-niksos = inputs.activate-niksos.packages.${pkgs.stdenv.hostPlatform.system}.default;
      inherit (pkgs) ani-cli brightnessctl;
    };
  in
    mkBinds (
      (mkWorkspacesBinds config)
      ++ (mkColumnsBinds 10)
      ++ [
        {
          bind = "Mod+Ctrl+K";
          desc = "Enter the `kill mode`";
          action = fish "pkill -9 -P $(niri msg -j pick-window | jaq .pid)";
        }
        {
          bind = "Mod+Ctrl+Alt+Shift+E";
          desc = "Exit niri";
          action = quit;
        }
        {
          bind = "Mod+Shift+Q";
          desc = "Close the focused window";
          action = close-window;
        }
      ]
      ++ [
        {
          bind = "Mod+M";
          desc = "Toggle the maximized state of the focused column";
          action = maximize-column;
        }
        {
          bind = "Mod+U";
          desc = "Switch between preset column widths backwards";
          action = switch-preset-column-width-back;
        }
        {
          bind = "Mod+P";
          desc = "Switch between preset column widths";
          action = switch-preset-column-width;
        }
      ]
      ++ [
        {
          bind = "F11";
          desc = "Toggle fullscreen on the focused window";
          action = fullscreen-window;
        }
        {
          bind = "Mod+F";
          desc = "Move the focused window between the floating and the tiling layout";
          action = toggle-window-floating;
        }
        {
          bind = "Mod+Ctrl+F";
          desc = "Toggles the focus between the floating and the tiling layout";
          action = switch-focus-between-floating-and-tiling;
        }
      ]
      ++ [
        {
          bind = "Mod+Ctrl+Alt+B";
          desc = "Reload bar";
          action = fish "reload_bar";
        }
        {
          bind = "Mod+Ctrl+Alt+N";
          desc = "Reload notifications";
          action = fish "reload_notifications";
        }
      ]
      ++ [
        {
          bind = "Mod+A";
          desc = "Launch app menu";
          action = rofi "drun";
        }
        {
          bind = "Mod+B";
          desc = "Launch browser";
          action = spawn "zen";
        }
        {
          bind = "Mod+D";
          desc = "Launch Discord";
          action = spawn "equibop";
        }
        {
          bind = "Mod+E";
          desc = "Launch file manager";
          action = spawn "thunar";
        }
        {
          bind = "Mod+N";
          desc = "Open notification center";
          action = spawn "swaync-client" "-t";
        }
        {
          bind = "Mod+R";
          desc = "Execute command";
          action = rofi "run";
        }
        {
          bind = "Mod+T";
          desc = "Launch terminal";
          action = spawn "wezterm";
        }
        {
          bind = "Mod+V";
          desc = "Open clipboard history";
          action = fish "clipboard_log";
        }
        {
          bind = "Mod+X";
          desc = "Delete an item from the clipboard history";
          action = fish "clipboard_delete_item";
        }
        {
          bind = "Mod+Tab";
          desc = "Toggle overview";
          action = toggle-overview;
        }
        {
          bind = "Mod+Escape";
          desc = "Open logout menu";
          action = spawn "wlogout";
        }
        {
          bind = "Mod+Semicolon";
          desc = "Open emoju menu";
          action = fish "clipboard_emoji";
        }
      ]
      ++ [
        {
          bind = "Mod+Shift+A";
          desc = "Open 2fa menu";
          action = rofi "2fa";
        }
        {
          bind = "Mod+Shift+C";
          desc = "Launch color picker";
          action = fish "select_color";
        }
        {
          bind = "Mod+Shift+F";
          desc = "Open file browser menu";
          action = rofi "filebrowser";
        }
        {
          bind = "Mod+Shift+G";
          desc = "Lock session";
          action = spawn "hyprlock";
        }
        {
          bind = "Mod+Shift+M";
          desc = "Launch mail client";
          action = spawn "thunderbird";
        }
        {
          bind = "Mod+Shift+N";
          desc = "Mute notifications";
          action = spawn "swaync-client" "-d";
        }
        {
          bind = "Mod+Shift+T";
          desc = "Launch Telegram";
          action = spawn "AyuGram";
        }
        {
          bind = "Mod+Shift+W";
          desc = "Launch ani-cli";
          action = spawn "${packages.ani-cli}";
        }
        {
          bind = "Mod+Shift+X";
          desc = "Clear clipboard";
          action = fish "clipboard_clear";
        }
      ]
      ++ [
        {
          bind = "Mod+Shift+S";
          desc = "Take screenshot";
          action = fish "take_screenshot";
        }
        {
          bind = "Mod+Shift+Ctrl+S";
          desc = "Take screenshot (window)";
          action = fish "take_screenshot_window";
        }
        {
          bind = "Mod+Shift+Alt+S";
          desc = "Take screenshot (screen)";
          action = fish "take_screenshot_screen";
        }
      ]
      ++ (
        let
          toggle_scratchpad = selector: command: fish "niri msg action close-window --id $(niri msg -j windows | jaq -c '.[] | select(${selector}) | .id') || ${command}";
        in [
          {
            bind = "Mod+Ctrl+A";
            desc = "Toggle anti RKN software";
            action = toggle_scratchpad ".title == \"AmneziaVPN\"" "AmneziaVPN";
          }

          {
            bind = "Mod+Ctrl+E";
            desc = "Toggle easter egg";
            action = fish "pkill -9 activate-niksos || ${packages.activate-niksos}";
          }
          {
            bind = "Mod+Ctrl+N";
            desc = "Toggle night mode";
            action = fish "toggle_night_mode";
          }
          {
            bind = "Mod+Ctrl+P";
            desc = "Toggle airplane mode";
            action = fish "toggle_airplane_mode";
          }
          {
            bind = "Mod+Ctrl+V";
            desc = "Toggle volume menu";
            action = toggle_scratchpad ".app_id == \"org.pulseaudio.pavucontrol\"" "pavucontrol";
          }
          {
            bind = "Mod+Ctrl+W";
            desc = "Toggle wi-fi";
            action = fish "toggle_wifi";
          }
        ]
      )
      ++ [
        {
          bind = "Mod+K";
          desc = "Focus the window above";
          action = focus-window-up;
        }
        {
          bind = "Mod+J";
          desc = "Focus the window below";
          action = focus-window-down;
        }
        {
          bind = "Mod+H";
          desc = "Focus the column to the left";
          action = focus-column-left;
        }
        {
          bind = "Mod+L";
          desc = "Focus the column to the right";
          action = focus-column-right;
        }
        {
          bind = "Mod+Shift+K";
          desc = "Move the focused window up in a column";
          action = move-window-up;
        }
        {
          bind = "Mod+Shift+J";
          desc = "Move the focused window down in a column";
          action = move-window-down;
        }
        {
          bind = "Mod+Shift+H";
          desc = "Move the focused column to the left";
          action = move-column-left;
        }
        {
          bind = "Mod+Shift+L";
          desc = "Move the focused column to the right";
          action = move-column-right;
        }
      ]
      ++ [
        {
          bind = "Mod+Alt+T";
          desc = "Toggle the focused column between normal and tabbed display";
          action = toggle-column-tabbed-display;
        }
        {
          bind = "Mod+Slash";
          desc = "Consume or expel the focused window left";
          action = consume-or-expel-window-left;
        }
        {
          bind = "Mod+At";
          desc = "Consume or expel the focused window right";
          action = consume-or-expel-window-right;
        }
      ]
      ++ [
        {
          bind = "Mod+Home";
          desc = "Focus the first column";
          action = focus-column-first;
        }
        {
          bind = "Mod+End";
          desc = "Focus the last column";
          action = focus-column-last;
        }
        {
          bind = "Mod+Shift+Home";
          desc = "Move the focused column to the start of the workspace";
          action = move-column-to-first;
        }
        {
          bind = "Mod+Shift+End";
          desc = "Move the focused column to the end of the workspace";
          action = move-column-to-last;
        }
      ]
      ++ [
        {
          bind = "Mod+Exclam";
          desc = "Decrease the width of the focused window";
          action = set-window-width "-5%";
          repeat = true;
        }
        {
          bind = "Mod+Numbersign";
          desc = "Increase the width of the focused window";
          action = set-window-width "+5%";
          repeat = true;
        }
        {
          bind = "Mod+Shift+Exclam";
          desc = "Decrease the height of the focused window";
          action = set-window-height "-5%";
          repeat = true;
        }
        {
          bind = "Mod+Shift+Numbersign";
          desc = "Increase the height of the focused window";
          action = set-window-height "+5%";
          repeat = true;
        }
      ]
      ++ [
        {
          bind = "Mod+WheelScrollDown";
          desc = "Focus the workspace below";
          action = focus-workspace-down;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+WheelScrollUp";
          desc = "Focus the workspace above";
          action = focus-workspace-up;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+Shift+WheelScrollDown";
          desc = "Move the focused workspace down";
          action = move-workspace-down;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+Shift+WheelScrollUp";
          desc = "Move the focused workspace up";
          action = move-workspace-up;
          cooldown-ms = 150;
        }
      ]
      ++ [
        {
          bind = "Mod+Ctrl+WheelScrollDown";
          desc = "Focus the column to the left";
          action = focus-column-left;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+Ctrl+WheelScrollUp";
          desc = "Focus the column to the right";
          action = focus-column-right;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+Ctrl+Shift+WheelScrollDown";
          desc = "Move the focused column to the left";
          action = move-column-left;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+Ctrl+Shift+WheelScrollUp";
          desc = "Move the focused column to the right";
          action = move-column-right;
          cooldown-ms = 150;
        }
      ]
      ++ [
        {
          bind = "Mod+Page_Down";
          desc = "Focus the workspace below";
          action = focus-workspace-down;
        }
        {
          bind = "Mod+Page_Up";
          desc = "Focus the workspace above";
          action = focus-workspace-up;
        }
        {
          bind = "Mod+Shift+Page_Down";
          desc = "Move the focused workspace down";
          action = move-workspace-down;
        }
        {
          bind = "Mod+Shift+Page_Up";
          desc = "Move the focused workspace up";
          action = move-workspace-up;
        }
      ]
      ++ [
        {
          bind = "Mod+Alt+K";
          desc = "Focus the monitor above";
          action = focus-monitor-up;
        }
        {
          bind = "Mod+Alt+J";
          desc = "Focus the monitor below";
          action = focus-monitor-down;
        }
        {
          bind = "Mod+Alt+H";
          desc = "Focus the monitor to the left";
          action = focus-monitor-left;
        }
        {
          bind = "Mod+Alt+L";
          desc = "Focus the monitor to the right";
          action = focus-monitor-right;
        }
      ]
      ++ [
        {
          bind = "Mod+Alt+Shift+K";
          desc = "Move the focused window to the monitor above";
          action = move-window-to-monitor-up;
        }
        {
          bind = "Mod+Alt+Shift+J";
          desc = "Move the focused window to the monitor below";
          action = move-window-to-monitor-down;
        }
        {
          bind = "Mod+Alt+Shift+H";
          desc = "Move the focused window to the monitor to the left";
          action = move-window-to-monitor-left;
        }
        {
          bind = "Mod+Alt+Shift+L";
          desc = "Move the focused window to the monitor to the right";
          action = move-window-to-monitor-right;
        }
      ]
      ++ [
        {
          bind = "Mod+Alt+Ctrl+K";
          desc = "Move the focused column to the monitor above";
          action = move-column-to-monitor-up;
        }
        {
          bind = "Mod+Alt+Ctrl+J";
          desc = "Move the focused column to the monitor below";
          action = move-column-to-monitor-down;
        }
        {
          bind = "Mod+Alt+Ctrl+H";
          desc = "Move the focused column to the monitor to the left";
          action = move-column-to-monitor-left;
        }
        {
          bind = "Mod+Alt+Ctrl+L";
          desc = "Move the focused column to the monitor to the right";
          action = move-column-to-monitor-right;
        }
      ]
      ++ [
        {
          bind = "Mod+Alt+Ctrl+Shift+K";
          desc = "Move the focused workspace to the monitor above";
          action = move-workspace-to-monitor-up;
        }
        {
          bind = "Mod+Alt+Ctrl+Shift+J";
          desc = "Move the focused workspace to the monitor below";
          action = move-workspace-to-monitor-down;
        }
        {
          bind = "Mod+Alt+Ctrl+Shift+H";
          desc = "Move the focused workspace to the monitor to the left";
          action = move-workspace-to-monitor-left;
        }
        {
          bind = "Mod+Alt+Ctrl+Shift+L";
          desc = "Move the focused workspace to the monitor to the right";
          action = move-workspace-to-monitor-right;
        }
      ]
      ++ [
        {
          bind = "XF86MonBrightnessUp";
          desc = "Increase brightness by 10%";
          action = spawn packages.brightnessctl "--class=backlight" "set" "+10%";
          allow-when-locked = true;
          repeat = true;
        }
        {
          bind = "XF86MonBrightnessDown";
          desc = "Decrease brightness by 10%";
          action = spawn packages.brightnessctl "--class=backlight" "set" "10%-";
          allow-when-locked = true;
          repeat = true;
        }
      ]
      ++ [
        {
          bind = "XF86AudioRaiseVolume";
          desc = "Increase volume by 5%";
          action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05+";
          allow-when-locked = true;
          repeat = true;
        }
        {
          bind = "XF86AudioLowerVolume";
          desc = "Decrease volume by 5%";
          action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05-";
          allow-when-locked = true;
          repeat = true;
        }
        {
          bind = "Ctrl+XF86AudioRaiseVolume";
          desc = "Increase volume by 1%";
          action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.01+";
          allow-when-locked = true;
          repeat = true;
        }
        {
          bind = "Ctrl+XF86AudioLowerVolume";
          desc = "Decrease volume by 1%";
          action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.01-";
          allow-when-locked = true;
          repeat = true;
        }
      ]
      ++ [
        {
          bind = "XF86AudioMute";
          desc = "Mute audio";
          action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
          allow-when-locked = true;
        }
        {
          bind = "XF86AudioMicMute";
          desc = "Mute microphone";
          action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
          allow-when-locked = true;
        }
      ]
      ++ [
        {
          bind = "XF86AudioPlay";
          desc = "Toggle media play/pause";
          action = spawn "playerctl" "play-pause";
          allow-when-locked = true;
        }
        {
          bind = "XF86AudioPrev";
          desc = "Move to the previous track";
          action = spawn "playerctl" "previous";
          allow-when-locked = true;
        }
        {
          bind = "XF86AudioNext";
          desc = "Move to the next track";
          action = spawn "playerctl" "next";
          allow-when-locked = true;
        }
      ]
      ++ [
        {
          bind = "Mod+Ctrl+D";
          desc = "Power off all monitors via DPMS";
          action = power-off-monitors;
        }
      ]
    );
}
