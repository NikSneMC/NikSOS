args: let
  homes = import ./homes.nix args;
  hosts = import ./hosts.nix args;
in {
  inherit homes hosts;
  inherit (homes) mkHomes;
  inherit (hosts) mkHosts;
}
