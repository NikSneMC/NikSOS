mkHmModules: {inputs, ...}: {
  imports = mkHmModules [
    "terminal"
  ];

  theme = {
    flavor = "mocha";
    accent = "sky";

    wallpaper = "${inputs.assets}/wallpapers/wolfclan.png";
  };
}
