{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      corefonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      (nerdfonts.override {fonts = ["JetBrainsMono" "Noto"];})
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = ["Noto Serif"];
      sansSerif = ["Noto Sans"];
      monospace = ["JetBrainsMono Nerd Font"];
      emoji = [""];
    };
  };
}
