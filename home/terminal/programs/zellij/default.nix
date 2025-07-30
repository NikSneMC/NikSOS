{
  imports = [
    ./layouts
    ./plugins
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
  };
}
