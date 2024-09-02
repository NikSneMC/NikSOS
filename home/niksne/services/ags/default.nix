# TODO: make service from ags
{
  inputs,
  ...
}: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    configDir = null;
  };
}
