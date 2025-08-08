_: let
  mkEnabledPluginsFromList = plugins:
    plugins
    |> map (
      plugin: let
        value = {enabled = true;};
      in
        if builtins.isString plugin
        then {
          name = plugin;
          inherit value;
        }
        else {
          inherit (plugin) name;
          value = (builtins.removeAttrs plugin ["name"]) // value;
        }
    )
    |> builtins.listToAttrs;
in {
  inherit mkEnabledPluginsFromList;
}
