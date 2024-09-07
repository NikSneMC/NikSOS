{
  lpkgs,
  npkgs,
  ...
}: let
  patchIDEs = builtins.map (ide: ide.override { vmopts = ''
  --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
  --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

  -javaagent:${lpkgs.ja-netfilter}/ja-netfilter.jar=jetbrains
  ''; });
  
  ides = patchIDEs (with npkgs.jetbrains; [
    idea-ultimate
    # pycharm-professional
    # webstorm
    # rust-rover
    # goland
    # phpstorm
    # clion
  ]);
in {
  programs.jetbrains-remote = {
    enable = true;
    inherit ides;
  };
  home.packages = (ides ++ [ lpkgs.ja-netfilter ]);
}
