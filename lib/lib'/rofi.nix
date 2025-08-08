{lib, ...}: let
  mkValueString = value:
    if lib.isBool value
    then
      if value
      then "true"
      else "false"
    else if lib.isInt value
    then toString value
    else if (value._type or "") == "literal"
    then value.value
    else if lib.isString value
    then ''"${value}"''
    else if lib.isList value
    then "[ ${lib.strings.concatStringsSep "," (map mkValueString value)} ]"
    else abort "Unhandled value type ${builtins.typeOf value}";

  mkKeyValue = {
    sep ? ": ",
    end ? ";",
  }: name: value: "${name}${sep}${mkValueString value}${end}";

  mkRasiSection = name: value:
    if lib.isAttrs value
    then let
      toRasiKeyValue = lib.generators.toKeyValue {mkKeyValue = mkKeyValue {};};
      # Remove null values so the resulting config does not have empty lines
      configStr = toRasiKeyValue (lib.filterAttrs (_: v: v != null) value);
    in ''
      ${name} {
      ${configStr}}
    ''
    else
      (mkKeyValue {
          sep = " ";
          end = "";
        }
        name
        value)
      + "\n";

  toRasi = attrs:
    [
      (lib.filterAttrs (n: _: n == "@theme") attrs)
      (lib.filterAttrs (n: _: n == "@import") attrs)
      (removeAttrs attrs ["@theme" "@import"])
    ]
    |> lib.concatMap (lib.mapAttrsToList mkRasiSection)
    |> lib.concatStringsSep "\n";
in {
  inherit mkValueString mkKeyValue mkRasiSection toRasi;
}
