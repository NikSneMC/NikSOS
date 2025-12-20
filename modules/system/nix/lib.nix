{lib, ...}: let
  inherit (builtins) elem mapAttrs;
  inherit (lib) filterAttrs mapAttrs' mapAttrsToList;

  registryPathsFor = config: names:
    config.nix.registry
    |> (filterAttrs (name: _: (elem name names)))
    |> (mapAttrs' (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    }));

  mappedRegistryFrom = inputs:
    inputs
    |> (filterAttrs (_: lib.isType "flake"))
    |> (mapAttrs (_: flake: {inherit flake;}))
    |> (flakes: flakes // {nixpkgs.flake = inputs.nixpkgs;})
    |> (mappedRegistry: mappedRegistry // {default-flake = mappedRegistry.nixpkgs;});

  mkNixPath = config: mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;
in {
  inherit registryPathsFor mappedRegistryFrom mkNixPath;
}
