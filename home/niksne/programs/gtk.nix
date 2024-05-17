{
  pkgs,
  config,
  lib,
  ...
}: {
  home = {
    pointerCursor.size = 24;
    packages = with pkgs; [
      numix-icon-theme-circle
    ];
  };

  gtk = {
    enable = true;

    catppuccin = {
      enable = true;
      cursor.enable = true;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      size = 10;
    };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      # extraConfig = "gtk-application-prefer-dark-theme = 1";
    };
    # gtk3.extraConfig = {
    #   gtk-application-prefer-dark-theme = 1;
    # };
    # gtk4.extraConfig = {
    #   gtk-application-prefer-dark-theme = 1;
    # };

    iconTheme = {
      name = "Colloid-teal-dracula-dark";
      package = pkgs.colloid-icon-theme.override { 
        schemeVariants = [ "dracula" ];
        colorVariants = [ "teal" ]; 
      };
    };
  };
}
