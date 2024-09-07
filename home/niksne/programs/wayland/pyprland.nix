{
  pkgs,
  ...
}: let
  tomlFormat = pkgs.formats.toml {};
in {
  home.packages = with pkgs; [ pyprland ];

  xdg.configFile."hypr/pyprland.toml".source = tomlFormat.generate "pyprland-config" {
    pyprland.plugins = [
      "scratchpads"
      "fetch_client_menu"
    ];
    fetch_client_menu.separator = "";
    scratchpads = {
      term = {
        command = "kitty --class kitty_dropdown";
        animation = "fromTop";
        size = "70% 70%";
        class = "kitty_dropdown";
        excludes = "*";
        unfocus = "hide";
        margin = 75;
        lazy = true;
      };
      volume = {
        command = "pavucontrol";
        animation = "fromLeft";
        size = "40% 70%";
        class = "org.pulseaudio.pavucontrol";
        excludes = "*";
        unfocus = "hide";
        margin = 75;
        lazy = true;
      };
      player = {
        command = "spotify";
        animation = "fromBottom";
        size = "70% 70%";
        match_by = "initialTitle";
        initialTitle = "Spotify";
        excludes = "*";
        unfocus = "hide";
        margin = 75;
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
