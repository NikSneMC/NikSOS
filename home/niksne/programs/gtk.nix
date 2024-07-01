{
  pkgs,
  config,
  lib,
  ...
}: {
  home = {
    # pointerCursor = {
    #   name = "Catppuccin-Mocha-Sky-Cursors";
    #   size = 24;
    # };
    packages = with pkgs; [
      numix-icon-theme-circle
    ];
  };

  gtk = {
    enable = true;

    catppuccin = {
      enable = true;
	    icon.enable = false;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      size = 10;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "Colloid-teal-dracula-dark";
      package = pkgs.colloid-icon-theme.override { 
        schemeVariants = [ "dracula" ];
        colorVariants = [ "teal" ]; 
      };
    };
  };
}
