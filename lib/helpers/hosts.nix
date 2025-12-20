{
  flakeRoot,
  inputs,
  keys,
  lib,
  lib',
  ...
}: let
  inherit (builtins) mapAttrs attrValues;
  inherit (lib) nixosSystem optionals filterAttrs;
  inherit (lib') filesNamed;
  tagsHelpers = lib'.tags;

  mkHosts = hosts:
    hosts
    |> mapAttrs (hostName: {tags, ...}: let
      hasTags = tagsHelpers.hasTags tags;
      withoutTags = tagsHelpers.withoutTags tags;
    in
      nixosSystem {
        specialArgs = {
          modulesPath = "${inputs.nixpkgs}/nixos/modules";

          inherit inputs keys lib' flakeRoot;
        };

        modules = let
          hostPath = flakeRoot + "/hosts/${hostName}";
        in
          (filesNamed "module.nix" (flakeRoot + "/modules/system"))
          ++ (filesNamed "module.nix" (flakeRoot + "/hosts/modules"))
          ++ (filesNamed "module.nix" (hostPath + "/modules"))
          ++ (optionals (withoutTags ["wsl" "avf"]) [
            inputs.disko.nixosModules.disko
            "${hostPath}/disks/default.nix"

            "${hostPath}/hardware-configuration.nix"
          ])
          ++ (optionals (hasTags ["wsl"]) [
            inputs.nixos-wsl.nixosModules.default
            {
              wsl.enable = true;
            }
          ])
          ++ (optionals (hasTags ["avf"]) [
            inputs.nixos-avf.nixosModules.avf
          ])
          ++ [
            inputs.catppuccin.nixosModules.catppuccin
            "${hostPath}/host.nix"
            {
              networking = {inherit hostName;};
            }
            {
              modules = {
                core = {
                  inherit tags;
                };

                nix.builders.builders =
                  hosts
                  |> filterAttrs (_: _: hasTags ["builder"])
                  |> mapAttrs (
                    hostName: {extras, ...}: {
                      inherit hostName;
                      builderType = extras.builderType or (throw ''builder hosts should have 'extras.builderType' set!'');
                    }
                  )
                  |> attrValues;
              };
            }
          ];
      });
in {
  inherit mkHosts;
}
