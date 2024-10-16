{config, ...}: {
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
    style = ''
      * {
        all: unset;
        font-size: 14px;
        font-family: "JetBrainsMono Nerd Font";
        transition: 200ms;
      }

      trough highlight {
        background: #${config.theme.colors.text};
      }

      scale trough {
        margin: 0rem 1rem;
        background-color: #${config.theme.colors.surface0};
        min-height: 8px;
        min-width: 70px;
      }

      slider {
        background-color: #${config.theme.colors.blue};
      }

      .floating-notifications.background .notification-row .notification-background {
        border: 1px solid #${config.theme.colors.surface0};
        margin: 18px;
        background-color: #${config.theme.colors.base};
        color: #${config.theme.colors.text};
        padding: 0px;
      }

      .floating-notifications.background .notification-row .notification-background .notification {
        padding: 7px;
      }

      .floating-notifications.background .notification-row .notification-background .notification.critical {
        border: 1px solid #${config.theme.colors.red};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content {
        margin: 7px;
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .summary {
        color: #${config.theme.colors.text};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .time {
        color: #${config.theme.colors.subtext0};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .body {
        color: #${config.theme.colors.text};
      }

      .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* {
        min-height: 3.4rem;
      }

      .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action {
        color: #${config.theme.colors.text};
        background-color: #${config.theme.colors.surface0};
        border: 1px solid #${config.theme.colors.surface1};
        margin: 7px;
      }

      .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action:hover {
        border: 1px solid #${config.theme.colors.surface1};
        background-color: #${config.theme.colors.surface0};
        color: #${config.theme.colors.text};
      }

      .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action:active {
        border-color: #${config.theme.colors.surface1};
        background-color: #${config.theme.colors.sapphire};
        color: #${config.theme.colors.text};
      }

      .floating-notifications.background .notification-row .notification-background .close-button {
        margin: 7px;
        border-radius: 1rem;
        color: #${config.theme.colors.base};
        background-color: #${config.theme.colors.red};
      }

      .floating-notifications.background .notification-row .notification-background .close-button:hover {
        background-color: #${config.theme.colors.maroon};
        color: #${config.theme.colors.base};
      }

      .floating-notifications.background .notification-row .notification-background .close-button:active {
        background-color: #${config.theme.colors.red};
        color: #${config.theme.colors.base};
      }

      .control-center {
        border: 1px solid #${config.theme.colors.surface0};
        background-color: #${config.theme.colors.base};
        color: #${config.theme.colors.text};
        padding: 14px;
      }

      .control-center .widget-title>label {
        color: #${config.theme.colors.text};
        font-size: 2rem;
      }

      .control-center .widget-title button {
        color: #${config.theme.colors.text};
        background-color: #${config.theme.colors.surface0};
        border: 1px solid #${config.theme.colors.surface1};
        padding: 8px;
      }

      .control-center .widget-title button:hover {
        border: 1px solid #${config.theme.colors.surface1};
        background-color: #${config.theme.colors.surface2};
        color: #${config.theme.colors.text};
      }

      .control-center .widget-title button:active {
        border: 1px solid #${config.theme.colors.surface1};
        background-color: #${config.theme.colors.sapphire};
        color: #${config.theme.colors.base};
      }

      .control-center .notification-row .notification-background {
        color: #${config.theme.colors.text};
        background-color: #${config.theme.colors.surface0};
        border: 1px solid #${config.theme.colors.surface1};
        margin-top: 14px;
      }

      .control-center .notification-row .notification-background .notification {
        padding: 7px;
      }

      .control-center .notification-row .notification-background .notification.critical {
        border: 1px solid #${config.theme.colors.red};
      }

      .control-center .notification-row .notification-background .notification .notification-content {
        margin: 7px;
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary {
        color: #${config.theme.colors.text};
      }

      .control-center .notification-row .notification-background .notification .notification-content .time {
        color: #${config.theme.colors.subtext0};
      }

      .control-center .notification-row .notification-background .notification .notification-content .body {
        color: #${config.theme.colors.text};
      }

      .control-center .notification-row .notification-background .notification>*:last-child>* {
        min-height: 3.4rem;
      }

      .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action {
        color: #${config.theme.colors.text};
        background-color: #${config.theme.colors.crust};
        border: 1px solid #${config.theme.colors.surface1};
        margin: 7px;
      }

      .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action:hover {
        border: 1px solid #${config.theme.colors.surface1};
        background-color: #${config.theme.colors.surface0};
        color: #${config.theme.colors.text};
      }

      .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action:active {
        border: 1px solid #${config.theme.colors.surface1};
        background-color: #${config.theme.colors.sapphire};
        color: #${config.theme.colors.text};
      }

      .control-center .notification-row .notification-background .close-button {
        margin: 7px;
        padding: 2px;
        color: #${config.theme.colors.base};
        background-color: #${config.theme.colors.maroon};
      }

      .close-button {
        border-radius: 6.3px;
      }

      .control-center .notification-row .notification-background .close-button:hover {
        background-color: #${config.theme.colors.red};
        color: #${config.theme.colors.base};
      }

      .control-center .notification-row .notification-background .close-button:active {
        background-color: #${config.theme.colors.red};
        color: #${config.theme.colors.base};
      }

      .control-center .notification-row .notification-background:hover {
        border: 1px solid #${config.theme.colors.surface1};
        background-color: #${config.theme.colors.overlay1};
        color: #${config.theme.colors.text};
      }

      .control-center .notification-row .notification-background:active {
        border: 1px solid #${config.theme.colors.surface1};
        background-color: #${config.theme.colors.sapphire};
        color: #${config.theme.colors.text};
      }

      .notification.critical progress {
        background-color: #${config.theme.colors.red};
      }

      .notification.low progress,
      .notification.normal progress {
        background-color: #${config.theme.colors.blue};
      }

      .control-center-dnd {
        margin-top: 5px;
        background: #${config.theme.colors.surface0};
        border: 1px solid #${config.theme.colors.surface1};
      }

      .control-center-dnd:checked {
        background: #${config.theme.colors.surface0};
      }

      .control-center-dnd slider {
        background: #${config.theme.colors.surface1};
      }

      .widget-dnd {
        margin: 0px;
        font-size: 1.1rem;
      }

      .widget-dnd>switch {
        font-size: initial;
        background: #${config.theme.colors.surface0};
        border: 1px solid #${config.theme.colors.surface1};
      }

      .widget-dnd>switch:checked {
        background: #${config.theme.colors.surface0};
      }

      .widget-dnd>switch slider {
        background: #${config.theme.colors.surface1};
        border: 1px solid #${config.theme.colors.overlay0};
      }

      .widget-mpris .widget-mpris-player {
        background: #${config.theme.colors.surface0};
        padding: 7px;
      }

      .widget-mpris .widget-mpris-title {
        font-size: 1.2rem;
      }

      .widget-mpris .widget-mpris-subtitle {
        font-size: 0.8rem;
      }

      .widget-menubar>box>.menu-button-bar>button>label {
        font-size: 3rem;
        padding: 0.5rem 2rem;
      }

      .widget-menubar>box>.menu-button-bar>:last-child {
        color: #${config.theme.colors.red};
      }

      .power-buttons,
      .powermode-buttons,
      .screenshot-buttons {

      }
      .power-buttons button:hover,
      .powermode-buttons button:hover,
      .screenshot-buttons button:hover {
        background: #${config.theme.colors.surface0};
      }

      .control-center .widget-label>label {
        color: #${config.theme.colors.text};
        font-size: 2rem;
      }

      .widget-buttons-grid {
        padding-top: 1rem;
      }

      .widget-buttons-grid>flowbox>flowboxchild>button label {
        font-size: 2.5rem;
      }

      .widget-volume {
        padding-top: 1rem;
      }

      .widget-volume label {
        font-size: 1.5rem;
        color: #${config.theme.colors.sapphire};
      }

      .widget-volume trough highlight {
        background: #${config.theme.colors.sapphire};
      }

      .widget-backlight trough highlight {
        background: #${config.theme.colors.yellow};
      }
      .widget-backlight scale {
        margin-right: 1rem;
      }

      .widget-backlight label {
        font-size: 1.5rem;
        color: #${config.theme.colors.yellow};
      }
    '';
  };
}
