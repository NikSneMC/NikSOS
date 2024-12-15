{
  config,
  inputs,
  ...
}: {
  imports = [
    ./specialisations.nix
    ./terminal
  ];

  home.file.".face".source = "${inputs.assets}/users/${config.home.user}.png";
}
