{config, ...}: let
  font_family = "JetBrainsMono Nerd Font Propo";
in {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = config.theme.wallpaper;
          blur_passes = 0;
          color = "$base";
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:5000] fish -c fetch_battery";
          color = "$accent";
          font_size = 25;
          inherit font_family;
          position = "30, 30";
          halign = "left";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "$TIME";
          color = "$text";
          font_size = 90;
          inherit font_family;
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:43200000] date +\"%A, %d %B %Y\"";
          color = "$text";
          font_size = 25;
          inherit font_family;
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "$FPRINTPROMPT";
          color = "$text";
          font_size = 14;
          inherit font_family;
          position = "0, -107";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:1000] fish -c fetch_music_player_data";
          color = "$text";
          font_size = 18;
          inherit font_family;
          position = "0, 40";
          halign = "center";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "$LAYOUT[ENG,RUS]";
          text_align = "center";
          color = "$text";
          font_size = 18;
          inherit font_family;
          position = "30, -30";
          halign = "left";
          valign = "top";
        }
      ];

      image = [
        {
          monitor = "";
          path = "${config.home.homeDirectory}/.face";
          size = 100;
          border_color = "$accent";

          position = "0, 75";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 60";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "$accent";
          inner_color = "$surface0";
          font_color = "$text";
          fade_on_empty = false;
          placeholder_text = "<span foreground=\"##$textAlpha\"><i>󰌾 Logged in as </i><span foreground=\"##$accentAlpha\">$USER</span></span>";
          check_color = "$accent";
          fail_color = "$red";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "$yellow";
          position = "0, -50";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
  catppuccin.hyprlock.useDefaultConfig = false;
}
