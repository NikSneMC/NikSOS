{
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    env = [
      "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
      "XDG_SESSION_TYPE, wayland"
      # "WLR_RENDERER_ALLOW_SOFTWARE, 1"
    ];

    exec-once = [
      "waybar"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "vesktop"
      "telegram-desktop"
      "whatsapp-for-linux"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "$accent";
      "col.inactive_border" = "$surface1";
      layout = "dwindle";
      allow_tearing = false;
      no_border_on_floating = false;
    };

    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
      };
      drop_shadow = true;
      shadow_range = 7;
      shadow_offset = "0 0";
      shadow_render_power = 3;
      "col.shadow" = "$accent";
      "col.shadow_inactive" = "$base";
      active_opacity = 0.99;
      inactive_opacity = 0.95;
      fullscreen_opacity = 1;
    };

    animations = {
      enabled = true;
      "bezier" = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    input = {
      kb_layout = "us, ru";
      kb_options = "grp:win_space_toggle";
      numlock_by_default = true;
      follow_mouse = 1;
      touchpad = {
        natural_scroll = true;
        scroll_factor = 0.5;
        middle_button_emulation = true;
      };
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };

    group = {
      groupbar = {
          "col.active" = "rgb(bd93f9) rgb(44475a) 90deg";
          "col.inactive" = "rgba(282a36dd)";
      };
    };

    dwindle.preserve_split = true;

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = 0;
      no_direct_scanout = false;
      animate_manual_resizes = true;
      animate_mouse_windowdragging = true;
      focus_on_activate = false;
      allow_session_lock_restore = false;
      background_color = "$base";
    };

    xwayland.force_zero_scaling = true;

    debug.disable_logs = false;
  };
}
