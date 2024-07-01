{
  npkgs,
  inputs,
  lib,
  config,
  ...
}: {
  home.packages = with npkgs; [
    pyprland
  ];

  xdg.configFile."hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [
      "scratchpads",
      "fetch_client_menu",
    ]

    [fetch_client_menu]
    separator = ""

    [scratchpads.term]
    command = "wezterm start --class wezterm_dropdown"
    animation = "fromTop"
    unfocus = "hide"
    excludes = "*"
    lazy = true

    [scratchpads.volume]
    command = "pavucontrol --class volume_sidemenu"
    animation = "fromLeft"
    class = "volume_sidemenu"
    size = "40% 70%"
    margin = 75
    unfocus = "hide"
    excludes = "*"
    lazy = true

    [scratchpads.player]
    command = "spotify"
    animation = "fromBottom"
    # unfocus = "hide"
    excludes = "*"
    lazy = true
  '';

  systemd.user.services.pyprland = {
    Unit = {
      Description = "Hyprland IPC written in python";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${lib.getExe npkgs.pyprland}";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}