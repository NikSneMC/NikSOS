{inputs, ...}: let
  inherit (builtins) concatLists;
in {
  services.accounts-daemon.enable = true;
  systemd.tmpfiles.rules = let
    users = ["niksne"];
  in
    users
    |> map (username: [
      "f+ /var/lib/AccountsService/users/${username}  0600 root root - [User]\\nIcon=/var/lib/AccountsService/icons/${username}\\n"
      "L+ /var/lib/AccountsService/icons/${username}  - - - - ${inputs.assets}/users/${username}.png"
    ])
    |> concatLists;
}
