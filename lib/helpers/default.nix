args: let
  hosts = import ./hosts.nix args;
  keys = import ./keys.nix args;
in {
  inherit hosts keys;

  inherit (hosts) mkHosts;
  inherit (keys) mkKeys;

  # TODO: implement proper homes helper;
  mkHomes = _: {};
}
