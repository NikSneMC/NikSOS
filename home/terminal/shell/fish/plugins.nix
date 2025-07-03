{pkgs, ...}: {
  programs.fish.plugins = [
    {
      name = "wakatime";
      inherit (pkgs.fishPlugins.wakatime-fish) src;
    }
  ];
}
