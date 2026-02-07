{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./documentation.nix
    ./caches.nix
    ./index.nix
    ./nh.nix
    ./nixpkgs.nix
  ];

  environment.systemPackages = [pkgs.git];

  nixpkgs.overlays = [
    (_: prev: {
      inherit (prev.lixPackageSets.stable) nixpkgs-review nix-eval-jobs nix-fast-build colmena;
    })
    inputs.nix-cachyos-kernel.overlays.pinned
  ];

  environment.etc = let
    commonPaths = ["home-manager" "nixpkgs"];
  in
    config.nix.registry
    |> (lib.filterAttrs (name: _: (builtins.elem name commonPaths)))
    |> (lib.mapAttrs' (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    }));

  nix = let
    mappedRegistry =
      inputs
      |> (lib.filterAttrs (_: lib.isType "flake"))
      |> (lib.mapAttrs (_: flake: {inherit flake;}))
      |> (flakes: flakes // {nixpkgs.flake = inputs.nixpkgs;});
  in {
    registry = mappedRegistry // {default-flake = mappedRegistry.nixpkgs;};

    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    package = pkgs.lixPackageSets.stable.lix;

    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";
    daemonIOSchedPriority = 7;

    settings = {
      use-xdg-base-directories = true;

      use-registries = true;
      flake-registry = pkgs.writeText "flakes-empty.json" (builtins.toJSON {
        flakes = [];
        version = 2;
      });

      auto-optimise-store = true;
      builders-use-substitutes = true;

      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operator"
        "cgroups"
        "auto-allocate-uids"
        "no-url-literals"
      ];

      keep-derivations = true;
      keep-outputs = true;

      trusted-users = [
        "root"
        "@wheel"
      ];

      max-jobs = "auto";

      sandbox = true;
      sandbox-fallback = false;

      system-features = ["nixos-test" "kvm" "recursive-nix" "big-parallel"];

      keep-going = true;

      log-lines = 30;

      pure-eval = false;

      warn-dirty = false;

      accept-flake-config = false;

      use-cgroups = pkgs.stdenv.isLinux;
    };
  };

  systemd.services.nix-gc = {
    unitConfig.ConditionACPower = true;
  };
}
