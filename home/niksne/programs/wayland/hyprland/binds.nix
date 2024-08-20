let
  mod = "SUPER";
  workspaces = (builtins.concatLists (
    builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in 
          builtins.toString (x + 1 - (c * 10));
      in [
        "${mod}, ${ws}, Open workspace ${toString (x + 1)}, workspace, ${toString (x + 1)}"
        "${mod} SHIFT, ${ws}, Move window to workspace ${toString (x + 1)}, movetoworkspace, ${toString (x + 1)}"
        "${mod} SHIFT ALT, ${ws}, Move window to workspace ${toString (x + 1)} (silent), movetoworkspacesilent, ${toString (x + 1)}"
      ]
    )
    10
  )) ++ (
    builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 13;
        in 
          builtins.toString (x + 1 - (c * 13));
      in "${mod}, F${ws}, Open workspace ${toString (x + 11)}, workspace, ${toString (x + 11)}"
    )
    12
  );

in {
  wayland.windowManager.hyprland.settings = {
    bindd = [
      ", F11, Make app fullscreen, fullscreen,"
      "${mod}, F, Toggle window floating, togglefloating," 
      "${mod}, J, Toggle window split, layoutmsg, togglesplit" # dwindle
      "${mod}, P, Move window to pseudo workspace, pseudo," # dwindle
      "${mod} CTRL, E, Exit hyprland, exit,"
      "${mod} SHIFT, Q, Close active window, killactive,"

      "${mod} CTRL ALT, B, Reload bar, exec, fish -c reload_bar"
      "${mod} CTRL ALT, N, Reload notifications, exec, fish -c reload_notifications"
      "${mod} CTRL ALT, P, Reload pyprland, exec, fish -c reload_pyprland"

      "${mod}, A, Launch app menu, exec, rofi -show drun"
      "${mod}, B, Launch browser, exec, vivaldi"
      "${mod}, D, Launch Discord, exec, vesktop" 
      "${mod}, E, Launch file manager, exec, thunar"
      "${mod}, K, Enter kill mode, exec, hyprctl kill"
      "${mod}, L, Lock session, exec, hyprlock"
      "${mod}, N, Open notification center, exec, swaync-client -t"
      "${mod}, R, Execute command, exec, rofi -show run"
      "${mod}, T, Open terminal, exec, kitty"
      "${mod}, V, Open clipboard history, exec, fish -c clipboard_log"
      "${mod}, W, Open \"Bring window to the workspace\" menu, exec, pypr fetch_client_menu"
      "${mod}, X, Delete item from clipboard, exec, fish -c clipboard_delete_item"
      "${mod}, TAB, Launch hyprexpo, hyprexpo:expo, toggle"
      "${mod}, ESCAPE, Open logout menu, exec, wlogout"
      "${mod}, SEMICOLON, Open emoji menu, exec, fish -c clipboard_emoji"

      "${mod} SHIFT, A, Open 2fa menu, exec, rofi -show 2fa"
      "${mod} SHIFT, B, Launch Blockbench, exec, blockbench"
      "${mod} SHIFT, C, Launch color picker, exec, fish -c select_color"
      "${mod} SHIFT, F, Open file browser menu, exec, rofi -show filebrowser"
      "${mod} SHIFT, G, Start screen recording (GIF), exec, fish -c record_screen_gif"
      "${mod} SHIFT, N, Mute notifications, exec, swaync-client -d"
      "${mod} SHIFT, R, Start screen recording (MP4), exec, fish -c record_screen_mp4"
      "${mod} SHIFT, S, Take screenshot, exec, fish -c record_screen_png"
      "${mod} SHIFT, T, Launch Telegram, exec, telegram-desktop"
      "${mod} SHIFT, V, Launch VSCodium, exec, codium"
      "${mod} SHIFT, W, Launch WhatsApp, exec, whatsapp-for-linux"
      "${mod} SHIFT, X, Clear clipboard, exec, fish -c clipboard_clear"

      # Scratchpads
      "${mod} CTRL, M, Toggle music player, exec, pypr toggle player"
      "${mod} CTRL, T, Toggle terminal, exec, pypr toggle term"
      "${mod} CTRL, V, Toggle volume menu, exec, pypr toggle volume"

      # Move focus with mod + arrow keys
      "${mod}, up, Move focus to the top window, movefocus, u"
      "${mod}, down, Move focus to the bottom window, movefocus, d"
      "${mod}, left, Move focus to the left window, movefocus, l"
      "${mod}, right, Move focus to the right window, movefocus, r"

      # Move window with mod + SHIFT + arrow keys
      "${mod} SHIFT, up, Move window up, movewindow, u"
      "${mod} SHIFT, down, Move window down, movewindow, d"
      "${mod} SHIFT, left, Move window left, movewindow, l"
      "${mod} SHIFT, right, Move window right, movewindow, r"

      # Scroll through existing workspaces with mod + scroll
      "${mod}, mouse_up, Switch to the previous opened workspace, workspace, e-1"
      "${mod}, mouse_down, Switch to the next opened workspace, workspace, e+1"

      # cycle workspaces on current monitor with mod + [/]
      "${mod}, bracketleft, Switch to the previous workspace on the current monitor, workspace, m-1"
      "${mod}, bracketright, Switch to the next workspace on the current monitor, workspace, m+1"
      
      # cycle monitors with mod + SHIFT + [/]
      "${mod} SHIFT, bracketleft, Switch to the left monitor, focusmonitor, l"
      "${mod} SHIFT, bracketright, Switch to the right monitor, focusmonitor, r"

      # send focused workspace to left/right monitors with mod + SHIFT + ALT + [/]
      "${mod} SHIFT ALT, bracketleft, Send focused workspace to the left monitor, movecurrentworkspacetomonitor, l"
      "${mod} SHIFT ALT, bracketright, Send focused workspace to the right monitor, movecurrentworkspacetomonitor, r"
    ] ++ workspaces;

    bindde = [
      # Resize window with mod + CTRL + arrow keys
      "${mod} CTRL, up, Change window size by 20 (up), resizeactive, 0 -20"
      "${mod} CTRL, down, Change window size by 20 (down), resizeactive, 0 20"
      "${mod} CTRL, left, Change window size by 20 (left), resizeactive, -20 0"
      "${mod} CTRL, right, Change window size by 20 (right), resizeactive, 20 0"
    ];

    binddm = [
      # Move/resize windows with mod + LMB/RMB | ALT LMB and dragging
      "${mod}, mouse:272, Move window with mouse, movewindow"
      "${mod}, mouse:273, Resize window with mouse, resizewindow"
      "${mod} ALT, mouse:272, Resize window with mouse (touchpad), resizewindow"
    ];

     binddl = [
      # suspend
      "${mod} CTRL, S, Suspend computer, exec, fish -c suspend"
      # lock preview
      # "${mod} SHIFT, S, Take screenshot (lock screen), exec, grimblast --cursor copy output"

      # media controls
      ", XF86AudioPlay, Toggle media play/pause, exec, playerctl play-pause"
      ", XF86AudioPrev, Move to previous track, exec, playerctl previous"
      ", XF86AudioNext, Move to next track, exec, playerctl next"

      # volume
      ", XF86AudioMute, Mute audio, exec, pamixer -t"
      ", XF86AudioMicMute, Mute microphone, exec, pamixer --default-source -t"
    ];

    binddle = [
      # volume
      ", XF86AudioRaiseVolume, Increase volume by 5, exec, pamixer -i 5"
      ", XF86AudioLowerVolume, Decrease volume by 5, exec, pamixer -d 5"
      "CTRL, XF86AudioRaiseVolume, Increase volume by 1, exec, pamixer -i 1"
      "CTRL, XF86AudioLowerVolume, Decrease volume by 1, exec, pamixer -d 1"

      # backlight
      ", XF86MonBrightnessUp, Increase brightness by 5, exec, brillo -q -u 300000 -A 5"
      ", XF86MonBrightnessDown, Decrease brightness by 5, exec, brillo -q -u 300000 -U 5"
      "CTRL, XF86MonBrightnessUp, Increase brightness by 1, exec, brillo -q -u 300000 -A 1"
      "CTRL, XF86MonBrightnessDown, Decrease brightness by 1, exec, brillo -q -u 300000 -U 1"
    ];
  };
}
