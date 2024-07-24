{
  ...
}: let
  dropterm = "class:^(wezterm_dropdown)$";
  volume_sidemenu = "class:^(pavucontrol)$";
  player = "class:^(Spotify)$";
in {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Rofi
      "stayfocused, class:^(Rofi)$"

      # VSCodium
      "workspace 11, class:^(codium-url-handler)$"

      # JetBrains IDEs
      "workspace 12, class:^(jetbrains-idea)$"
      # "tile, class:^(jetbrains-.*)$"

      # Arduino IDE
      "workspace 13, class:^(Arduino IDE)$"

      # Blockbench
      "workspace 14, class:^(Blockbench)$"

      # Vesktop
      "tile, class:^(vesktop)$"
      "workspace 15 silent, class:^(vesktop)$"

      # Telegram
      "float, title:^(Media viewer)$"
      "workspace 16 silent, class:^(org.telegram.desktop)$"

      # WhatsApp
      "workspace 17 silent, class:^(whatsapp-for-linux)$"


      # Vivaldi
      "suppressevent, fullscreen, class:(Vivaldi-stable)$"
      "tile, class:(Vivaldi-stable)$"
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "workspace special silent, title:^(Vivaldi — Sharing Indicator)$"
      "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"
      "idleinhibit focus, class:^(mpv|.+exe|celluloid)$"
      "idleinhibit focus, class:^(Vivaldi-stable)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(Vivaldi-stable)$"

      # OBS Studio
      "workspace 19, class:^(com.obsproject.Studio)$"

      # Prism Launcher
      "workspace 20, class:^(org.prismlauncher.PrismLauncher)$"

      # Minecraft
      "workspace 21, class:^(com.mojang.minecraft)$"
      "tile, class:^(Minecraft.*)$"
      "workspace 21, class:^(Minecraft.*)$"


      "dimaround, class:^(gcr-prompter)$"
      "dimaround, class:^(xdg-desktop-portal-gtk)$"
      "dimaround, class:^(polkit-gnome-authentication-agent-1)$"

      # fix xwayland apps
      # "rounding 0, xwayland:1"
      "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
      "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"

      "suppressevent, maximize, class:.*" # You'll probably like this.

      # scratchpads
      "float, ${dropterm}"
      "workspace special:scratch_term silent, ${dropterm}"

      "float, ${volume_sidemenu}"
      "workspace special:scratch_volume silent, ${volume_sidemenu}"

      "float, ${player}"
      "workspace special:scratch_player silent, ${player}"
    ];
  };
}
