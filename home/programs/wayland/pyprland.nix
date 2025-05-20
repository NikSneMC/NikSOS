{
  inputs,
  pkgs,
  ...
}: let
  tomlFormat = pkgs.formats.toml {};
in {
  home.packages = [inputs.pyprland.packages.${pkgs.system}.pyprland];

  xdg.configFile."hypr/pyprland.toml".source = tomlFormat.generate "pyprland-config" {
    pyprland.plugins = [
      "scratchpads"
      "fetch_client_menu"
    ];
    fetch_client_menu.separator = "";
    scratchpads = {
      term = {
        command = "rio --title-placeholder terminal_dropdown";
        animation = "fromTop";
        size = "70% 70%";
        match_by = "initialTitle";
        initialTitle = "terminal_dropdown";
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
        initialTitle = "spotify";
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
