{...} @ args:
[
  ./zellij-forgot.nix
  ./zjstatus.nix
  ./zsm.nix
]
|> map (file: import file args)
|> (
  plugins: let
    joinLines = builtins.concatStringsSep "\n";

    configs =
      plugins
      |> map (plugin: plugin.config)
      |> joinLines;

    toLoad =
      plugins
      |> builtins.filter (plugin: plugin.load)
      |> map (plugin: plugin.name)
      |> joinLines;
  in
    # kdl
    ''
      plugins {
        ${configs}
      }

      load_plugins {
        ${toLoad}
      }
    ''
)
