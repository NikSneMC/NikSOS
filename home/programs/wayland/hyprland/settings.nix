{
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    source = [
      "./monitors.conf"
    ];

    env = [
      "XDG_CURRENT_DESKTOP, Hyprland"
      "XDG_SESSION_DESKTOP, Hyprland"
    ];

    exec-once = [
      "waybar"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "${lib.getExe pkgs.hyprland-per-window-layout}"
      "equibop"
      "ayugram-desktop"
      "thunderbird"
      "pypr"
    ];

    general = {
      border_size = 2;
      gaps_in = 5;
      gaps_out = 10;
      "col.inactive_border" = "$surface1";
      "col.active_border" = "$accent";
      layout = "dwindle";
      allow_tearing = false;
    };

    decoration = {
      rounding = 10;
      active_opacity = 0.99;
      inactive_opacity = 0.95;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        popups = true;
      };
      shadow = {
        enabled = true;
        range = 7;
        color = "$accent";
        color_inactive = "$base";
      };
    };

    animations = {
      enabled = true;
      bezier = ["myBezier, 0.05, 0.9, 0.1, 1.05"];
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
      touchpad = {
        disable_while_typing = false;
        scroll_factor = 0.5;
        natural_scroll = true;
      };
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };

    group = with config.theme.colors; {
      "col.border_active" = "$accent";
      "col.border_inactive" = "$base";
      "col.border_locked_active" = "rgba(${notable.accent}ff)";
      "col.border_locked_inactive" = "rgba(${notable.text}ff)";
      groupbar = {
        text_color = "$text";
        "col.active" = "rgba(${base}bb)";
        "col.inactive" = "rgba(${surface1}bb)";
        "col.locked_active" = "rgba(${notable.text}bb)";
        "col.locked_inactive" = "rgba(${notable.subtext0}bb)";
      };
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = false;
      font_family = "JetBrainsMono Nerd Font";
      force_default_wallpaper = 0;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
      animate_manual_resizes = true;
      animate_mouse_windowdragging = true;
      focus_on_activate = false;
      allow_session_lock_restore = true;
      background_color = "$base";
    };

    xwayland.force_zero_scaling = true;

    render = {
      direct_scanout = true;
      explicit_sync = 0;
    };

    debug.disable_logs = false;

    dwindle = {
      preserve_split = true;
      smart_resizing = true;
    };
  };
}
