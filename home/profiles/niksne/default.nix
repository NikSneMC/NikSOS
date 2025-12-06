mkHmModules: {self, ...}: {
  imports = mkHmModules [
    "terminal"
  ];

  theme = {
    flavor = "mocha";
    accent = "blue";

    wallpaper = "${self}/assets/wallpapers/night_forest.png";
  };
}
