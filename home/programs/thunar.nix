{pkgs, ...}: {
  home.packages = with pkgs; [
    (thunar.override {
      thunarPlugins = with xfce; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
      ];
    })
  ];
}
