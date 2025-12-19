{lib, ...}: let
  inherit (lib) allUnique;

  withoutTags = tagged: denied: tagged ++ denied |> allUnique;

  hasTags = tagged: needed: !(withoutTags tagged needed);

  stateful = config: let
    inherit (config.modules.core) tags;
  in {
    hasTags = hasTags tags;
    withoutTags = withoutTags tags;
  };
in {
  inherit hasTags withoutTags stateful;
}
