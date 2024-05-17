{
  npkgs,
  ...
}: let
  ides = with npkgs.jetbrains; [
      idea-ultimate
      pycharm-professional
      webstorm
      rust-rover
      goland
      clion
      # gateway
      writerside
    ];
in {
  programs.jetbrains-remote = {
    enable = true;
    inherit ides;
  };
  home.packages = ides;
}
