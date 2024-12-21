{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      numix-icon-theme-circle
    ];
    pointerCursor.size = 24;
  };

  gtk = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
      size = 10;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "Colloid-Teal-Dracula-Dark";
      package = pkgs.colloid-icon-theme.override {
        schemeVariants = ["dracula"];
        colorVariants = ["teal"];
      };
    };
  };

  catppuccin.gtk.enable = true;
}
