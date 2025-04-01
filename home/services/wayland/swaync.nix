{
  services.swaync = {
    enable = true;
    settings = {
      "$schema" = "https://raw.githubusercontent.com/ErikReider/SwayNotificationCenter/main/src/configSchema.json";
      positionX = "right";
      positionY = "top";
      notification-icon-size = 48;
      notification-body-image-height = 160;
      notification-body-image-width = 90;
      timeout = 6;
      timeout-low = 4;
      timeout-critical = 0;
      fit-to-screen = true;
      notification-window-width = 350;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 100;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      scripts = {};
      notification-visibility = {
        example-name = {
          state = "muted";
          urgency = "Low";
          app-name = "Spotify";
        };
      };
      widgets = [
        "title"
        "dnd"
        "notifications"
        "mpris"
      ];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear";
        };
        dnd.text = "Do Not Disturb";
        mpris = {
          image-size = 96;
          image-radius = 6;
          blur = false;
        };
      };
    };
  };
  catppuccin.swaync.font = "JetBrainsMono Nerd Font";
}
