let
  inherit (import ./lib/helpers/keys.nix) mkKeys;
in
  mkKeys {
    users = {
      niksne = {
        nakama = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINdhtDO3Z1MrC/uICq7qSW6yMPfPW5WgvavrFHXIUpcP";
      };
    };

    hosts = {
      nakama = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHxsrqXzsiLa0mlMD1t0YggugeSKBh3FrU7D1+31na1H";
    };
  }
