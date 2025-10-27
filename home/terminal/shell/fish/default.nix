{
  imports = [
    ./functions
    ./plugins.nix
  ];

  programs.fish = {
    enable = true;
    shellInit =
      # fish
      ''
        fish_vi_key_bindings
      '';
    functions.fish_greeting.body = '''';
  };
}
