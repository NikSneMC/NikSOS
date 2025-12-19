{
  flakeRoot,
  keys,
  lib,
  ...
}: let
  inherit (builtins) mapAttrs elem attrNames split filter isString concatStringsSep listToAttrs;
  inherit (lib) filterAttrs dropEnd nameValuePair reverseList;

  secretsPath = "${flakeRoot}/secrets";

  mkSecrets = config:
    import "${secretsPath}/secrets.nix"
    |> mapAttrs (_: {publicKeys, ...}: publicKeys)
    |> filterAttrs (_: elem keys.hosts.${config.networking.hostName})
    |> attrNames
    |> map (
      secret:
        secret
        |> split "\\."
        |> filter isString
        |> dropEnd 1
    )
    |> map (
      parts:
        nameValuePair (
          parts
          |> reverseList
          |> concatStringsSep "-"
        ) {
          file =
            parts
            |> concatStringsSep "."
            |> (secret: "${secretsPath}/${secret}.age");
        }
    )
    |> listToAttrs;
in {
  inherit mkSecrets;
}
