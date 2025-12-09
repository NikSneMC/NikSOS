_: let
  mkIdes = pkgs: ides: plugins:
    ides
    |> map (
      ide:
        {
          package = pkgs.jetbrains.${ide}.override {
            vmopts = ''
              -Dnosplash=true
              --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
              --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

              -javaagent:${pkgs.custom.ja-netfilter}/ja-netfilter.jar=jetbrains
            '';
          };
        }
        // (
          if plugins ? ide
          then {plugins' = plugins.${ide};}
          else {}
        )
    )
    |> map (
      {
        package,
        plugins' ? [],
      }:
        pkgs.jetbrains.plugins.addPlugins package (plugins.common ++ plugins')
    );
in {
  inherit mkIdes;
}
