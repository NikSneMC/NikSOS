{config, ...}:
# kdl
''
  keybinds {
    session {
      bind "b" {
        LaunchOrFocusPlugin "zellij-forgot" {
          "LOAD_ZELLIJ_BINDINGS" "true"
          floating true
        }
        SwitchToMode "Normal"
      }

      bind "w" {
        LaunchOrFocusPlugin "zsm" {
          floating true
          move_to_focused_tab true

          default_layout "custom"

          session_separator "_"

          show_resurrectable_sessions true

          base_paths "${config.home.homeDirectory}/Projects"
        }
        SwitchToMode "Normal"
      }
    }
  }
''
