{
  imports = [
    ./fish
    ./starship.nix
  ];

  home = {
    shell = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    shellAliases = {
      jq = "jaq";
      fetch = "fastfetch";
    };
  };
}
