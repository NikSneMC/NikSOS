{
  keys,
  lib,
  ...
}: let
  mkUsers = hashedPasswords:
    keys.users
    |> lib.filterAttrs (_: value: builtins.isAttrs value)
    |> builtins.mapAttrs (username: {publicKeys ? [], ...}: {
      isNormalUser = true;
      extraGroups = [
        "input"
        "wheel"
      ];
      inherit (hashedPasswords.${username}) hashedPassword;
      openssh.authorizedKeys.keys = publicKeys;
    });
in {
  inherit mkUsers;
}
