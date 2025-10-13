{
  inputs,
  lib',
  pkgs,
  ...
}: let
  commonLSPs = {
    wakatime-ls = {
      command = "wakatime-ls";
    };
  };

  commonPackages = with pkgs; [
    inputs.wakatime-ls.packages.${stdenv.hostPlatform.system}.wakatime-ls
  ];

  langfiles = [
    ./bash.nix
    ./c.nix
    ./ci.nix
    ./docker.nix
    ./elixir.nix
    ./fish.nix
    ./go.nix
    ./helm.nix
    ./just.nix
    ./jvm.nix
    ./latex.nix
    ./nix.nix
    ./protobuf.nix
    ./python.nix
    ./qml.nix
    ./rust.nix
    ./systemd.nix
    ./toml.nix
    ./web.nix
    ./yaml.nix
    ./zig.nix
  ];
in
  lib'.helix.mkHelixLangs pkgs langfiles commonLSPs commonPackages
