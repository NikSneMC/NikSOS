{lib, ...}: let
  mkEnabledPluginsFromList = plugins:
    lib.pipe plugins [
      (map (
        plugin: let
          value = {enable = true;};
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
      ))
      builtins.listToAttrs
    ];

  mkUserPlugins = plugins: builtins.mapAttrs (_: {source, ...}: source) plugins.user;

  mkCasedPluginTitles = caseRule: plugins:
    lib.pipe plugins.user [
      (lib.filterAttrs caseRule)
      (lib.mapAttrsToList (name: _: name))
    ];
  mkLowerPluginTitles = mkCasedPluginTitles (_: {lowerNamed ? false, ...}: lowerNamed);
  mkUpperPluginTitles = mkCasedPluginTitles (_: {upperNamed ? false, ...}: upperNamed);

  mkUserPluginsFor = plugins: platform:
    lib.pipe platform [
      (p: lib.filterAttrs (_: {platform ? "vencord", ...}: platform == p) plugins.user)
      (builtins.mapAttrs (_: {settings ? {}, ...}: settings // {enable = true;}))
    ];

  mkPluginsFor = plugins: platform: (mkEnabledPluginsFromList plugins.${platform}) // (mkUserPluginsFor plugins platform);
in {
  inherit mkEnabledPluginsFromList mkUserPlugins mkLowerPluginTitles mkUpperPluginTitles mkUserPluginsFor mkPluginsFor;
}
