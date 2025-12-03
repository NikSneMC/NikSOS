{
  programs.zed-editor = {
    enable = true;

    installRemoteServer = true;

    userSettings = {
      agent = {
        always_allow_tool_actions = true;
        play_sound_when_agent_done = true;
      };
      audio."experimental.rodio_audio" = true;
      auto_update = false;
      buffer_font_family = "JetBrainsMono Nerd Font Mono";
      buffer_font_size = 15;
      calls.mute_on_join = true;
      diagnostics.inline.enabled = true;
      git_panel.sort_by_path = true;
      helix_mode = true;
      inlay_hints.enabled = true;
      languages = {
        Rust = {
          completions.lsp = false;
          enable_language_server = false;
        };
      };
      tabs = {
        file_icons = true;
        git_status = true;
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      title_bar = {
        show_branch_icon = true;
        show_menus = true;
      };
      ui_font_family = "JetBrainsMono Nerd Font Propo";
      ui_font_size = 16;
    };
  };
}
