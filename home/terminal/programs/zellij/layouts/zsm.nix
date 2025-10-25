{
  xdg.configFile."zellij/layouts/zsm.kdl".text =
    # kdl
    ''
      layout {
        default_tab_template {
          pane size=1 borderless=true {
            plugin location="zjstatus"
          }
          pane {
            plugin location="zsm"
          }
        }
      }
    '';
}
