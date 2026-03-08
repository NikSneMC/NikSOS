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
      btw = "fastfetch";
      jq = "jaq";
      lazypodman = "lazydocker";
    };
  };
}
