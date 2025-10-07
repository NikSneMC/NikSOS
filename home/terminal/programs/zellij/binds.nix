{config, ...}:
# kdl
''
  keybinds {
    shared_except "locked" {
      bind "Ctrl y" {
        LaunchOrFocusPlugin "zellij-forgot" {
          "LOAD_ZELLIJ_BINDINGS" "true"
          floating true
        }
      }
    }

    session {
      bind "w" {
        LaunchOrFocusPlugin "zsm" {
          floating true
          move_to_focused_tab true

          default_layout "development"

          session_separator "_"

          show_resurrectable_sessions true

          base_paths "${config.home.homeDirectory}/Projects"
        }
      }
    }
  }
''
