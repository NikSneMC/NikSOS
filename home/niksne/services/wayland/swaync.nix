{
  config,
  theme,
  ...
}: let
  palette = theme."${config.theme.flavor}";
in {
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
        background: ${palette.palette.text};
      }

      scale trough {
        margin: 0rem 1rem;
        background-color: ${palette.palette.surface0};
        min-height: 8px;
        min-width: 70px;
      }

      slider {
        background-color: ${palette.palette.blue};
      }

      .floating-notifications.background .notification-row .notification-background {
        border: 1px solid ${palette.palette.surface0};
        margin: 18px;
        background-color: ${palette.palette.base};
        color: ${palette.palette.text};
        padding: 0px;
      }

      .floating-notifications.background .notification-row .notification-background .notification {
        padding: 7px;
      }

      .floating-notifications.background .notification-row .notification-background .notification.critical {
        border: 1px solid ${palette.palette.red};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content {
        margin: 7px;
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .summary {
        color: ${palette.palette.text};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .time {
        color: ${palette.palette.subtext0};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .body {
        color: ${palette.palette.text};
      }

      .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* {
        min-height: 3.4rem;
      }

      .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action {
        color: ${palette.palette.text};
        background-color: ${palette.palette.surface0};
        border: 1px solid ${palette.palette.surface1};
        margin: 7px;
      }

      .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action:hover {
        border: 1px solid ${palette.palette.surface1};
        background-color: ${palette.palette.surface0};
        color: ${palette.palette.text};
      }

      .floating-notifications.background .notification-row .notification-background .notification>*:last-child>* .notification-action:active {
        border-color: ${palette.palette.surface1};
        background-color: ${palette.palette.sapphire};
        color: ${palette.palette.text};
      }

      .floating-notifications.background .notification-row .notification-background .close-button {
        margin: 7px;
        border-radius: 1rem;
        color: ${palette.palette.base};
        background-color: ${palette.palette.red};
      }

      .floating-notifications.background .notification-row .notification-background .close-button:hover {
        background-color: ${palette.palette.maroon};
        color: ${palette.palette.base};
      }

      .floating-notifications.background .notification-row .notification-background .close-button:active {
        background-color: ${palette.palette.red};
        color: ${palette.palette.base};
      }

      .control-center {
        border: 1px solid ${palette.palette.surface0};
        background-color: ${palette.palette.base};
        color: ${palette.palette.text};
        padding: 14px;
      }

      .control-center .widget-title>label {
        color: ${palette.palette.text};
        font-size: 2rem;
      }

      .control-center .widget-title button {
        color: ${palette.palette.text};
        background-color: ${palette.palette.surface0};
        border: 1px solid ${palette.palette.surface1};
        padding: 8px;
      }

      .control-center .widget-title button:hover {
        border: 1px solid ${palette.palette.surface1};
        background-color: ${palette.palette.surface2};
        color: ${palette.palette.text};
      }

      .control-center .widget-title button:active {
        border: 1px solid ${palette.palette.surface1};
        background-color: ${palette.palette.sapphire};
        color: ${palette.palette.base};
      }

      .control-center .notification-row .notification-background {
        color: ${palette.palette.text};
        background-color: ${palette.palette.surface0};
        border: 1px solid ${palette.palette.surface1};
        margin-top: 14px;
      }

      .control-center .notification-row .notification-background .notification {
        padding: 7px;
      }

      .control-center .notification-row .notification-background .notification.critical {
        border: 1px solid ${palette.palette.red};
      }

      .control-center .notification-row .notification-background .notification .notification-content {
        margin: 7px;
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary {
        color: ${palette.palette.text};
      }

      .control-center .notification-row .notification-background .notification .notification-content .time {
        color: ${palette.palette.subtext0};
      }

      .control-center .notification-row .notification-background .notification .notification-content .body {
        color: ${palette.palette.text};
      }

      .control-center .notification-row .notification-background .notification>*:last-child>* {
        min-height: 3.4rem;
      }

      .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action {
        color: ${palette.palette.text};
        background-color: ${palette.palette.crust};
        border: 1px solid ${palette.palette.surface1};
        margin: 7px;
      }

      .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action:hover {
        border: 1px solid ${palette.palette.surface1};
        background-color: ${palette.palette.surface0};
        color: ${palette.palette.text};
      }

      .control-center .notification-row .notification-background .notification>*:last-child>* .notification-action:active {
        border: 1px solid ${palette.palette.surface1};
        background-color: ${palette.palette.sapphire};
        color: ${palette.palette.text};
      }

      .control-center .notification-row .notification-background .close-button {
        margin: 7px;
        padding: 2px;
        color: ${palette.palette.base};
        background-color: ${palette.palette.maroon};
      }

      .close-button {
        border-radius: 6.3px;
      }

      .control-center .notification-row .notification-background .close-button:hover {
        background-color: ${palette.palette.red};
        color: ${palette.palette.base};
      }

      .control-center .notification-row .notification-background .close-button:active {
        background-color: ${palette.palette.red};
        color: ${palette.palette.base};
      }

      .control-center .notification-row .notification-background:hover {
        border: 1px solid ${palette.palette.surface1};
        background-color: ${palette.palette.overlay1};
        color: ${palette.palette.text};
      }

      .control-center .notification-row .notification-background:active {
        border: 1px solid ${palette.palette.surface1};
        background-color: ${palette.palette.sapphire};
        color: ${palette.palette.text};
      }

      .notification.critical progress {
        background-color: ${palette.palette.red};
      }

      .notification.low progress,
      .notification.normal progress {
        background-color: ${palette.palette.blue};
      }

      .control-center-dnd {
        margin-top: 5px;
        background: ${palette.palette.surface0};
        border: 1px solid ${palette.palette.surface1};
      }

      .control-center-dnd:checked {
        background: ${palette.palette.surface0};
      }

      .control-center-dnd slider {
        background: ${palette.palette.surface1};
      }

      .widget-dnd {
        margin: 0px;
        font-size: 1.1rem;
      }

      .widget-dnd>switch {
        font-size: initial;
        background: ${palette.palette.surface0};
        border: 1px solid ${palette.palette.surface1};
      }

      .widget-dnd>switch:checked {
        background: ${palette.palette.surface0};
      }

      .widget-dnd>switch slider {
        background: ${palette.palette.surface1};
        border: 1px solid ${palette.palette.overlay0};
      }

      .widget-mpris .widget-mpris-player {
        background: ${palette.palette.surface0};
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
        color: ${palette.palette.red};
      }

      .power-buttons,
      .powermode-buttons,
      .screenshot-buttons {
            
      }
      .power-buttons button:hover,
      .powermode-buttons button:hover,
      .screenshot-buttons button:hover {
        background: ${palette.palette.surface0};
      }

      .control-center .widget-label>label {
        color: ${palette.palette.text};
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
        color: ${palette.palette.sapphire};
      }

      .widget-volume trough highlight {
        background: ${palette.palette.sapphire};
      }

      .widget-backlight trough highlight {
        background: ${palette.palette.yellow};
      }
      .widget-backlight scale {
        margin-right: 1rem;
      }

      .widget-backlight label {
        font-size: 1.5rem;
        color: ${palette.palette.yellow};
      }
    '';
  };
}