modules: {inputs, ...}: {
  imports = [
    "${modules}/terminal"
  ];

  theme = {
    flavor = "mocha";
    accent = "sky";

    wallpaper = "${inputs.assets}/wallpapers/wolfclan.png";
  };
}
