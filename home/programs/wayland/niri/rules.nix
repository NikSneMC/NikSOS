{
  programs.niri.settings = {
    window-rules = [
      {
        open-maximized = true;
      }
      {
        matches = [
          {is-focused = true;}
        ];
        opacity = 0.99;
      }
      {
        matches = [
          {is-focused = false;}
        ];
        opacity = 0.95;
      }
      {
        matches = [
          {app-id = "dev.zed.*";}
          {app-id = "jetbrains-.*";}
        ];
        open-on-workspace = "development";
      }
      {
        matches = [
          {app-id = "zen";}
          {app-id = "spotify";}
        ];
        open-on-workspace = "misc";
      }
      {
        matches = [
          {app-id = "equibop";}
          {app-id = "vesktop";}
          {app-id = "discord";}
          {app-id = "com.ayugram";}
          {app-id = "thunderbird";}
        ];
        open-on-workspace = "social";
      }
      {
        matches = [
          {app-id = "org.prismlauncher.PrismLauncher";}
          {app-id = "com.mojang.*";}
          {app-id = "Minecraft.*";}
          {app-id = "steam.*";}
          {app-id = "factorio";}
          {app-id = "mono";}
          {app-id = "Terraria.bin.x86_64";}
        ];
        open-on-workspace = "gaming";
      }
      {
        matches = [
          {app-id = "com.obsproject.Studio";}
        ];
        open-on-workspace = "recording/streaming";
      }
      {
        matches = [
          {title = "AmneziaVPN";}
          {app-id = "org.pulseaudio.pavucontrol";}
          {app-id = ".blueman-manager-wrapped";}
          {
            app-id = "com.ayugram.desktop";
            title = "Mini App: .*";
          }
        ];
        open-floating = true;
      }
    ];
  };
}
