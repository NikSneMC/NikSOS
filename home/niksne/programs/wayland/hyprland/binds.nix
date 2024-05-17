let
  mod = "SUPER";
  workspaces = builtins.concatLists (builtins.genList (
    x: let
      ws = let
        c = (x + 1) / 10;
      in 
        builtins.toString (x + 1 - (c * 10));
    in [
      "${mod}, ${ws}, workspace, ${toString (x + 1)}"
      "${mod} SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      "${mod} SHIFT ALT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
    ]
  )
  10);

  workspaces_special = builtins.concatLists (builtins.genList (
    x: let
      ws = let
        c = (x + 1) / 13;
      in 
        builtins.toString (x + 1 - (c * 13));
    in [
      "${mod}, F${ws}, workspace, ${toString (x + 11)}"
    ]
  )
  12);

in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      ", F11, fullscreen,"
      "${mod}, F, togglefloating," 
      "${mod}, J, togglesplit," # dwindle
      "${mod}, P, pseudo," # dwindle
      "${mod} CTRL, E, exit, e"
      "${mod} SHIFT, Q, killactive,"

      "${mod} CTRL ALT, B, exec, fish -c reload_bar"
      "${mod} CTRL ALT, N, exec, fish -c reload_notifications"
      "${mod} CTRL ALT, P, exec, fish -c reload_pyprland"

      "${mod}, A, exec, rofi -show drun"
      "${mod}, B, exec, vivaldi"
      "${mod}, D, exec, vesktop" 
      "${mod}, E, exec, thunar"
      "${mod}, L, exec, hyprlock"
      "${mod}, N, exec, swaync-client -t"
      "${mod}, R, exec, rofi -show run"
      "${mod}, T, exec, wezterm"
      "${mod}, V, exec, fish -c clipboard_log"
      "${mod}, W, exec, pypr fetch_client_menu"
      "${mod}, X, exec, fish -c clipboard_delete_item"
      # "${mod}, Q, hyprexpo:expo, toggle"
      "${mod}, ESCAPE, exec, wlogout"
      "${mod}, SEMICOLON, exec, fish -c clipboard_emoji"

      "${mod} SHIFT, A, exec, rofi -show 2fa"
      "${mod} SHIFT, B, exec, firefox"
      "${mod} SHIFT, C, exec, fish -c select_color"
      "${mod} SHIFT, F, exec, rofi -show filebrowser"
      "${mod} SHIFT, G, exec, fish -c record_screen_gif"
      "${mod} SHIFT, N, exec, swaync-client -d"
      "${mod} SHIFT, R, exec, fish -c record_screen_mp4"
      "${mod} SHIFT, S, exec, fish -c record_screen_png"
      "${mod} SHIFT, T, exec, telegram-desktop"
      "${mod} SHIFT, V, exec, codium"
      "${mod} SHIFT, W, exec, whatsapp-for-linux"
      "${mod} SHIFT, X, exec, fish -c clipboard_clear"

      # Scratchpads
      "${mod} CTRL, M, exec, pypr toggle player"
      "${mod} CTRL, T, exec, pypr toggle term"
      "${mod} CTRL, V, exec, pypr toggle volume"

      # Move focus with mod + arrow keys
      "${mod}, up, movefocus, u"
      "${mod}, down, movefocus, d"
      "${mod}, left, movefocus, l"
      "${mod}, right, movefocus, r"

      # Move window with mod + SHIFT + arrow keys
      "${mod} SHIFT, up, movewindow, u"
      "${mod} SHIFT, down, movewindow, d"
      "${mod} SHIFT, left, movewindow, l"
      "${mod} SHIFT, right, movewindow, r"

      # Scroll through existing workspaces with mod + scroll
      "${mod}, mouse_up, workspace, e-1"
      "${mod}, mouse_down, workspace, e+1"
    ]
    ++ workspaces ++ workspaces_special;

    bindr = [
    #   # launcher
    #   "${mod}, SUPER_L, exec, pkill .anyrun-wrapped || anyrun"
    ];

    binde = [
      # Resize window with mod + CTRL + arrow keys
      "${mod} CTRL, up, resizeactive, 0 -20"
      "${mod} CTRL, down, resizeactive, 0 20"
      "${mod} CTRL, left, resizeactive, -20 0"
      "${mod} CTRL, right, resizeactive, 20 0"
    ];

    bindm = [
      # Move/resize windows with mod + LMB/RMB | ALT LMB and dragging
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
      "${mod} ALT, mouse:272, resizewindow"
    ];

     bindl = [
      # suspend
      "${mod} CTRL, S, exec, fish -c suspend"
      # lock preview
      # "${mod} SHIFT, S, exec, grimblast --cursor copy output"

      # media controls
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"

      # volume
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioMicMute, exec, pamixer --default-source -t"
    ];

    bindle = [
      # volume
      ", XF86AudioRaiseVolume, exec, pamixer -i 1"
      ", XF86AudioLowerVolume, exec, pamixer -d 1"

      # backlight
      ", XF86MonBrightnessUp, exec, brillo -q -u 300000 -A 5"
      ", XF86MonBrightnessDown, exec, brillo -q -u 300000 -U 5"
    ];
  };
}
