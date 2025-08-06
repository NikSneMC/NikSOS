mkHmModules: {inputs, ...}: {
  imports = mkHmModules [
    "terminal"
  ];

  theme = {
    flavor = "mocha";
    accent = "blue";

    wallpaper = "${inputs.assets}/wallpapers/night_forest.png";
  };
}
