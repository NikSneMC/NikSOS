builderTypes: {
  config,
  keys,
  lib,
  lib',
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (import ./lib.nix {inherit config builderTypes keys lib lib';}) isBuilder;

  sshOpts = ''command="nix-daemon --stdio",no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding'';
in {
  config = mkIf isBuilder {
    users = {
      groups.builder = {};
      users.builder = {
        shell = pkgs.bash;
        isSystemUser = true;
        createHome = true;
        group = "builder";
        home = "/var/empty";
        openssh.authorizedKeys.keys =
          keys.publicKeys
          |> map (key: ''${sshOpts} ${key}'');
      };
    };
  };
}
