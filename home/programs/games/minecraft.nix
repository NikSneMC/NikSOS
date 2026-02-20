{pkgs, ...}: {
  home.packages = with pkgs; [
    (prismlauncher.override {
      jdk8 = zulu8;
      jdk17 = zulu17;
      jdk21 = zulu21;
      jdk25 = zulu25;
    })
  ];
}
