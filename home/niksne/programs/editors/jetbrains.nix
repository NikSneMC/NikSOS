{
  inputs,
  npkgs,
  ...
}: let
  vmopts = ''
  --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
  --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

  -javaagent:${inputs.self.packages.${npkgs.system}.ja-netfilter}/ja-netfilter.jar=jetbrains
  '';
  ides = with npkgs.jetbrains; [
    (idea-ultimate.override { inherit vmopts; })
    (pycharm-professional.override { inherit vmopts; })
    (webstorm.override { inherit vmopts; })
    (rust-rover.override { inherit vmopts; })
    (goland.override { inherit vmopts; })
    (phpstorm.override { inherit vmopts; })
    (clion.override { inherit vmopts; })
  ];
in {
  programs.jetbrains-remote = {
    enable = true;
    inherit ides;
  };
  home.packages = (ides ++ [ inputs.self.packages.${npkgs.system}.ja-netfilter ]);
}
