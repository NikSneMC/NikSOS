args: {
  imports = [
    ./layouts
  ];

  programs.zellij = {
    enable = true;

    settings = {
      copy_command = "wl-copy";
      default_layout = "custom";
      mirror_session = true;
      show_startup_tips = false;
      show_release_notes = false;
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
