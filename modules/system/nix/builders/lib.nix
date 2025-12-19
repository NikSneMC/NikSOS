{
  config,
  builderTypes,
  keys,
  lib,
  lib',
  ...
}: let
  inherit (builtins) filter;
  inherit (lib) recursiveUpdate;
  inherit (lib'.tags.stateful config) hasTags;

  isBuilder = hasTags ["builder"];

  mkBuilder = {
    builderType,
    hostName,
    ...
  }:
    recursiveUpdate builderTypes.${builderType} {
      hostName = "${hostName}.${config.networking.domain}";
    };

  mkBuildersConfig = {
    distributedBuilds =
      isBuilder
      |> (pred: !pred);

    buildMachines =
      config.modules.nix.builders.builders
      |> map mkBuilder
      |> filter (builder: builder.hostName != config.networking.hostName);
  };

  mkKnownBuilderHosts =
    config.modules.nix.builders.builders
    |> map ({hostName, ...}:
      lib.nameValuePair "${hostName}.${config.networking.domain}" {publicKey = keys.hosts.${hostName};})
    |> builtins.listToAttrs;
in {
  inherit isBuilder mkBuilder mkBuildersConfig mkKnownBuilderHosts;
}
