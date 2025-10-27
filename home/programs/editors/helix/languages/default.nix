{
  inputs,
  lib,
  lib',
  osConfig,
  pkgs,
  ...
}: let
  notForHosts = lib'.notForHosts osConfig;

  commonLSPs =
    {
      wakatime-ls = {
        command = "wakatime-ls";
      };
    }
    // (notForHosts lib.optionalAttrs ["tobichi"] {
      discord-rpc = {
        command = "discord-rpc-lsp";
      };
    });

  commonPackages = with pkgs;
    [
      inputs.wakatime-ls.packages.${stdenv.hostPlatform.system}.wakatime-ls
    ]
    ++ (
      inputs.discord-rpc-lsp.packages.${stdenv.hostPlatform.system}.default
      |> notForHosts lib.optional ["tobichi"]
    );

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
