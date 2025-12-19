{...}: let
  override = option: attrs: option // attrs;
  overrideWith = attrs: option: override option attrs;

  overrideDefaultWith = default: overrideWith {inherit default;};
  overrideDefault = option: default: overrideDefaultWith default option;
in {
  inherit override overrideWith overrideDefault overrideDefaultWith;
}
