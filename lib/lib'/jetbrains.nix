{lib, ...}: let
  inherit (builtins) mapAttrs split attrValues;
  inherit (lib) fakeHash last;

  mkPlugins = pkgs: plugins:
    plugins
    |> mapAttrs (_: value:
      value
      |> mapAttrs (
        url: hash: let
          inherit (pkgs) fetchzip fetchurl;

          ext = url |> split "\\." |> last;

          args = {
            inherit url;

            hash =
              if hash == null
              then fakeHash
              else hash;
          };
        in
          if ext == "zip"
          then fetchzip args
          else if ext == "jar"
          then fetchurl (args // {executable = true;})
          else throw "unsupported plugin extension: ${ext}"
      )
      |> attrValues);

  mkIdes = pkgs: ides: plugins': let
    plugins = mkPlugins pkgs plugins';
  in
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
