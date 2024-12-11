{pkgs, ...}: let
  ides = mkIdesList (with pkgs.custom.jetbrains; [
    idea-ultimate
    # pycharm-professional
    # webstorm
    # rust-rover
    # goland
    # phpstorm
    # clion
  ]);

  mkIdesList = map (ide:
    ide.override {
      vmopts = ''
        --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
        --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

        -javaagent:${pkgs.custom.ja-netfilter}/ja-netfilter.jar=jetbrains
      '';
    }
  );
in {
  programs.jetbrains-remote = {
    enable = true;
    inherit ides;
  };
  home.packages = ides;
}
