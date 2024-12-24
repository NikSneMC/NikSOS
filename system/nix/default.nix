{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./caches.nix
    ./nh.nix
    ./nixpkgs.nix
  ];

  environment.systemPackages = [pkgs.git];

  nix = {
    # pin the registry to avoid downloading and evaling a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: {flake = v;}) inputs;

    # set the path for channels compat
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    package = pkgs.nixVersions.stable;
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes" "pipe-operators"];
      flake-registry = "/etc/nix/registry.json";

      keep-derivations = true;
      keep-outputs = true;

      trusted-users = [
        "root"
        "@wheel"
      ];
    };
  };
}
