{
  imports = [
    ./toggles.nix
  ];

  programs.fish.functions = {
    select_color.body =
      # fish
      ''
        set COLOR (dms color pick -a)
        if [ $COLOR != "" ]
            notify-send dms "copied selected color to the clipboard!"
        end
      '';
  };
}
