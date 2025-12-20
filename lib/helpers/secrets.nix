let
  inherit (builtins) listToAttrs;

  mkEnv = hosts: users: nameFn: groups: type:
    listToAttrs (map (name: {
        name = nameFn type name;
        value.publicKeys = [hosts.${type}] ++ users.publicKeys;
      })
      groups);
in {
  inherit mkEnv;
}
