{
  config,
  keys,
  lib,
  lib',
  ...
}: let
  inherit (builtins) attrNames;
  inherit (lib) recursiveUpdate mkEnableOption mkOption types mkIf;

  buildersLib = import ./lib.nix {
    inherit config builderTypes keys lib lib';
  };
  # TODO: finish builders
  # inherit (buildersLib) isBuilder;
  inherit (buildersLib.stateful config) mkBuildersConfig mkKnownBuilderHosts;

  builderTypes = rec {
    regular = {
      systems = ["x86_64-linux"];
      speedFactor = 4;
      maxJobs = 4;
      supportedFeatures = ["benchmark" "nixos-test"];
      protocol = "ssh-ng";
      sshUser = "builder";
      sshKey = "/etc/ssh/ssh_host_ed25519_key";
    };

    big = recursiveUpdate regular {
      systems = regular.systems ++ ["aarch64-linux" "i686-linux"];
      maxJobs = 16;
      speedFactor = 16;
      supportedFeatures = regular.supportedFeatures ++ ["kvm" "big-parallel"];
    };
  };

  cfg = config.modules.nix.builders;
in {
  options.modules.nix.builders = {
    enable = mkEnableOption "remote buliders";

    builders = mkOption {
      type = types.listOf (types.submodule {
        options = {
          hostName = mkOption {
            type = types.str;
          };

          builderType = mkOption {
            type = types.nullOr (types.enum (attrNames builderTypes));
          };
        };
      });
    };
  };

  imports = [
    (import ./user.nix builderTypes)
  ];

  config = mkIf cfg.enable {
    nix = {
      inherit (mkBuildersConfig config) distributedBuilds buildMachines;

      # TODO: complete konran and use it as a builder
      # settings.max-jobs =
      #   if isBuilder
      #   then "auto"
      #   else 0;
      settings.max-jobs = "auto";
    };

    programs.ssh.knownHosts = mkKnownBuilderHosts config;
  };
}
