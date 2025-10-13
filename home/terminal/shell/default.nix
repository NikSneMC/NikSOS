{
  imports = [
    ./fish
    ./starship.nix
  ];

  home.shellAliases = {
    jq = "jaq";
    fetch = "fastfetch";
  };
}
