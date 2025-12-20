{
  keys,
  lib,
  ...
}: let
  inherit (lib) recursiveUpdate;

  mkUsers = configOverrides:
    keys.users
    |> lib.filterAttrs (_: value: builtins.isAttrs value)
    |> builtins.mapAttrs (
      _username: {publicKeys ? [], ...}: {
        isNormalUser = true;
        extraGroups = [
          "input"
          "networkmanager"
          "video"
          "wheel"
        ];
        openssh.authorizedKeys.keys = publicKeys;
      }
    )
    |> recursiveUpdate configOverrides;
in {
  inherit mkUsers;
}
