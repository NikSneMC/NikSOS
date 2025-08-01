{config, ...}: let
  dropterm = "class:^(terminal_dropdown)$";
  volume_sidemenu = "class:^(org.pulseaudio.pavucontrol)$";
  player = "class:^(spotify)$";
  displays_sidemenu = "class:^(nwg-displays)$";
  antirkn = "initialTitle:^(AmneziaVPN)$";
in {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # VSCodium
      "workspace 11, class:^(codium)$"

      # IntelliJ IDEA
      "workspace 12, class:^(jetbrains-idea)$"

      # Arduino IDE
      "workspace 13, class:^(Arduino IDE)$"

      # Blockbench
      "workspace 14, class:^(Blockbench)$"

      # Discord
      "workspace 15 silent, class:^(equibop)$"

      # Telegram
      "float, title:^(Media viewer)$"
      "workspace 16 silent, class:^(com.ayugram)$"

      # Thunderbird
      "workspace 17 silent, class:^(thunderbird)$"

      # Vivaldi
      "suppressevent, fullscreen, class:(vivaldi-stable)$"
      "tile, class:(vivaldi-stable)$"
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "workspace special silent, title:^(Vivaldi — Sharing Indicator)$"
      "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"
      "idleinhibit focus, class:^(mpv|.+exe|celluloid)$"
      "idleinhibit focus, class:^(vivaldi-stable)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(vivaldi-stable)$"

      # OBS Studio
      "workspace 19, class:^(com.obsproject.Studio)$"

      # Prism Launcher
      "workspace 20, class:^(org.prismlauncher.PrismLauncher)$"

      # Minecraft
      "workspace 21, class:^(com.mojang.*)$"
      "tile, class:^(Minecraft.*)$"
      "workspace 21, class:^(Minecraft.*)$"

      "dimaround, class:^(gcr-prompter)$"
      "dimaround, class:^(xdg-desktop-portal-gtk)$"
      "dimaround, class:^(polkit-gnome-authentication-agent-1)$"

      # fix xwayland apps
      # "rounding 0, xwayland:1"
      "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
      "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"

      # mark xwayland apps
      "bordercolor rgb(${config.theme.colors.notable.accent}), xwayland:1"

      # You'll probably like this
      "suppressevent, maximize, class:.*"
      # scratchpads
      "float, ${dropterm}"
      "workspace special:scratch_term silent, ${dropterm}"

      "float, ${volume_sidemenu}"
      "workspace special:scratch_volume silent, ${volume_sidemenu}"

      "float, ${player}"
      "workspace special:scratch_player silent, ${player}"

      "float, ${displays_sidemenu}"
      "workspace special:scratch_displays silent, ${displays_sidemenu}"

      "float, ${antirkn}"
      "workspace special:scratch_antirkn silent, ${antirkn}"
    ];

    layerrule = [
      "blur, waybar"
      "blur, rofi"
      "blur, swaync-control-center"
      "blur, swaync-notification-window"
      "ignorezero, waybar"
      "ignorezero, rofi"
      "ignorezero, swaync-control-center"
      "ignorezero, swaync-notification-window"
    ];
  };
}
