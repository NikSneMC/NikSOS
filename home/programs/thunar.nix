{pkgs, ...}: {
  home.packages = with pkgs.xfce; [
    (thunar.override {
      thunarPlugins = [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
      ];
    })
  ];
}
