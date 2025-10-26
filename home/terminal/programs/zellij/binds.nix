{...}:
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
        }
        SwitchToMode "Normal"
      }
    }
  }
''
