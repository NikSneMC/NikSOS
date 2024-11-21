{
  lib,
  lpkgs,
  npkgs,
  ...
}: let
  ides =
    lib.pipe (with npkgs.jetbrains; [
      idea-ultimate
      # pycharm-professional
      # webstorm
      # rust-rover
      # goland
      # phpstorm
      # clion
    ]) [
      (builtins.map (
        ide:
          ide.override {
            vmopts = ''
              --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
              --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

              -javaagent:${lpkgs.ja-netfilter}/ja-netfilter.jar=jetbrains
            '';
          }
      ))
    ];
in {
  programs.jetbrains-remote = {
    enable = true;
    inherit ides;
  };
  home.packages = ides;
}
