{
  xdg.configFile."zellij/layouts/custom.kdl".text =
    # kdl
    ''
      layout {
        default_tab_template {
          pane size=1 borderless=true {
            plugin location="zjstatus"
          }
          children
        }
      }
    '';
}
