{
  config,
  lib,
  ...
}: {
  imports = [
    ./specialisations.nix
    ./terminal
  ];

  home.file.".face".source = let
    url = "https://raw.githubusercontent.com/NikSneMC/NikSOS/assets/users/${config.home.user}.png";
    sha256 = "1p2sd07ch30hrnh85x2l2wchsazsmifrkcbrfxbbmvmidag07mdr";
    filename = lib.last (lib.splitString "/" url);
  in
    builtins.fetchurl {
      name = "${sha256}-user-${filename}";
      inherit url sha256;
    };
}
