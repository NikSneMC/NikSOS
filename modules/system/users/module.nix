{
  keys,
  lib,
  pkgs,
  ...
}: let
  inherit (import ./lib.nix {inherit keys lib;}) mkUsers;
in {
  config = {
    users = {
      mutableUsers = false;
      allowNoPasswordLogin = false;
      enforceIdUniqueness = true;

      users = mkUsers {
        niksne = {
          initialHashedPassword = "$y$j9T$l4DeIv1F4IavM4cZ662Um1$TLzF2xx.thPu5otqumFf9vpMZKX87.uEol5O0wqHWk5";
          shell = pkgs.fish;
        };
        root.hashedPassword = "*";
      };
    };
  };
}
