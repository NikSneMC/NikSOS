let
  mkPublicKeys = keys: keys // {publicKeys = builtins.attrValues keys;};

  mkUsers = users:
    (users:
      users
      // {
        publicKeys = builtins.concatLists (map (userSet: userSet.publicKeys) (builtins.attrValues users));
      }) (builtins.mapAttrs (_: userSet: mkPublicKeys userSet) users);

  mkKeys = {
    users,
    hosts,
  }: let
    keys = {
      users = mkUsers users;
      hosts = mkPublicKeys hosts;
    };
  in {
    inherit (keys) users hosts;
    publicKeys = keys.users.publicKeys ++ keys.hosts.publicKeys;
  };
in {
  inherit mkKeys;
}
