{...}: let
  zellijPlugin = {
    url,
    name,
    sha256,
    config ? "",
    load ? false,
  }: let
    package = builtins.fetchurl {
      inherit url sha256;
      name = "zellij-plugin-${name}";
    };
  in {
    inherit name load;

    config =
      # kdl
      ''
        ${name} location="file://${package}" {
          ${config}
        }
      '';
  };
in {
  inherit zellijPlugin;
}
