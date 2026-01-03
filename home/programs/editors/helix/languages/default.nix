{
  inputs,
  lib,
  lib',
  osConfig,
  pkgs,
  ...
}: let
  notForHosts = lib'.notForHosts osConfig;

  headlessHosts = ["tobichi" "renga"];

  commonLSPs =
    {
      uwu-colors = {
        command = "uwu_colors";
      };
      wakatime-ls = {
        command = "wakatime-ls";
      };
    }
    // (notForHosts headlessHosts lib.optionalAttrs {
      discord-rpc = {
        command = "discord-rpc-lsp";
      };
    });

  commonPackages = with pkgs; let
    inherit (stdenv.hostPlatform) system;
  in
    [
      uwu-colors
      inputs.wakatime-ls.packages.${system}.wakatime-ls
    ]
    ++ (
      notForHosts headlessHosts lib.optional inputs.discord-rpc-lsp.packages.${system}.default
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
    ./surql.nix
    ./systemd.nix
    ./tofu.nix
    ./toml.nix
    ./typst.nix
    ./web.nix
    ./yaml.nix
    ./zig.nix
  ];
in
  lib'.helix.mkHelixLangs pkgs langfiles commonLSPs commonPackages
