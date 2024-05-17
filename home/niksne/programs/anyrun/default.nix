{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;

    # config = {
    #   plugins = with inputs.anyrun.packages.${pkgs.system}; [
    #     applications
    #     # randr
    #     rink
    #     shell
    #     symbols
    #   ];

    #   hidePluginInfo = true;
    #   closeOnClick = true;
    #   showResultsImmediately = true;
    # };
  };
}