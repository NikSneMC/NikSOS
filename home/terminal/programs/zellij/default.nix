args: {
  imports = [
    ./layouts
  ];

  programs.zellij = {
    enable = true;

    settings = {
      default_layout = "zsm";
      mirror_session = true;
      show_startup_tips = false;
      show_release_notes = false;
      ui.pane_frames.rounded_corners = true;
    };

    extraConfig =
      [
        ./plugins
        ./binds.nix
      ]
      |> map (file: import file args)
      |> builtins.concatStringsSep "\n";
  };
}
