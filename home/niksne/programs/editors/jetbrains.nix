{
  inputs,
  pkgs,
  ...
}: let
  vmopts = ''
  -javaagent:${inputs.self.packages.${pkgs.system}.ja-netfilter}/ja-netfilter.jar=jetbrains
  --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
  --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED
  '';
  ides = with pkgs.jetbrains; [
    (idea-ultimate.override { inherit vmopts; })
    (pycharm-professional.override { inherit vmopts; })
    (webstorm.override { inherit vmopts; })
    (rust-rover.override { inherit vmopts; })
    (goland.override { inherit vmopts; })
    (phpstorm.override { inherit vmopts; })
    # clion
  ];
in {
  programs.jetbrains-remote = {
    enable = true;
    inherit ides;
  };
  home.packages = ((with pkgs.jetbrains; [
    # gateway
    (writerside.override { inherit vmopts; })
  ]) ++ ides ++ [ inputs.self.packages.${pkgs.system}.ja-netfilter ]);
}
