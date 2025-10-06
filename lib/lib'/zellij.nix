{...}: let
  fetchZellijPlugin = {
    url,
    name,
    sha256,
  }:
    builtins.fetchurl {
      inherit url sha256;
      name = "zellij-plugin-${name}";
    };
in {
  inherit fetchZellijPlugin;
}
