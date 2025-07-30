{pkgs, ...}: let
  tomlFormat = pkgs.formats.toml {};
in {
  home.packages = with pkgs; [pyprland];

  xdg.configFile."hypr/pyprland.toml".source = tomlFormat.generate "pyprland-config" {
    pyprland.plugins = [
      "scratchpads"
      "fetch_client_menu"
    ];
    fetch_client_menu.separator = "";
    scratchpads = {
      term = {
        command = "wezterm -e --class terminal_dropdown";
        animation = "fromTop";
        size = "70% 70%";
        match_by = "initialClass";
        initialClass = "terminal_dropdown";
        multi = false;
        excludes = "*";
        unfocus = "hide";
        margin = 75;
        lazy = true;
      };
      volume = {
        command = "pavucontrol";
        animation = "fromLeft";
        size = "40% 70%";
        match_by = "class";
        class = "org.pulseaudio.pavucontrol";
        excludes = "*";
        multi = false;
        unfocus = "hide";
        margin = 75;
        lazy = true;
      };
      player = {
        command = "spotify";
        animation = "fromBottom";
        size = "70% 70%";
        multi = false;
        match_by = "class";
        class = "spotify";
        excludes = "*";
        margin = 75;
        lazy = true;
        process_tracking = false;
      };
      displays = {
        command = "nwg-displays";
        animation = "fromLeft";
        size = "40% 70%";
        match_by = "class";
        class = "nwg-displays";
        excludes = "*";
        multi = false;
        unfocus = "hide";
        margin = 145;
        lazy = true;
      };
      antirkn = {
        command = "AmneziaVPN";
        animation = "fromRight";
        match_by = "initialTitle";
        initialTitle = "AmneziaVPN";
        excludes = "*";
        multi = false;
        unfocus = "hide";
        lazy = true;
      };
    };
  };

  # systemd.user.services.pyprland = {
  #   Unit = {
  #     Description = "Hyprland IPC written in python";
  #     PartOf = ["graphical-session.target"];
  #   };
  #   Service = {
  #     ExecStart = "${lib.getExe pkgs.pyprland}";
  #     Restart = "on-failure";
  #   };
  #   Install.WantedBy = ["graphical-session.target"];
  # };
}
