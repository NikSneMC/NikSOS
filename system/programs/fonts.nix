{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      corefonts
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];

    fontconfig.defaultFonts = {
      monospace = ["JetBrainsMono Nerd Font"];
    };
  };
}
