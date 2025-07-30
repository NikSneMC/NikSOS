{
  imports = [
    ./checkers.nix
    ./clipboard.nix
    ./fetchers.nix
    ./notifications.nix
    ./records.nix
    ./reloads.nix
    ./toggles.nix
  ];

  programs.fish.functions = {
    select_color.body =
      # fish
      ''
        set COLOR (${lib.getExe pkgs.hyprpicker} -a -r)
        if [ $COLOR != "" ]
            notify-send hyprpicker "copied selected color to the clipboard!"
        end
      '';
    suspend.body =
      # fish
      ''
        hyprlock & \
        systemctl suspend
      '';
  };
}
