{lib, ...}: let
  mkBgImageSection = config: name:
    lib.pipe "${config.programs.wlogout.package}/share/wlogout/assets/${name}.svg" [
      builtins.readFile
      (builtins.split "\n")
      (builtins.filter builtins.isString)
      (lines:
        # svg
        ''
          ${builtins.elemAt lines 0}
          ${builtins.elemAt lines 3}
          <defs><style type="text/css"><![CDATA[
              path {
                 fill: #${config.theme.colors.accent};
              }
          ]]></style></defs>
          ${builtins.elemAt lines 5}
          ${builtins.elemAt lines 6}
        '')
      (builtins.toFile "wlogout-${name}-icon.svg")
      (file:
        # css
        ''
          #${name} {
            background-image: image(url("${file}"));
          }
        '')
    ];

  mkBgImageCss = config: lib.concatMapStringsSep "\n" (mkBgImageSection config);
in {
  inherit mkBgImageCss;
}
