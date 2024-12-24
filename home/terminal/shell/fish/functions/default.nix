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
    select_color.body = ''
      set COLOR (hyprpicker -a -r)
      if [ $COLOR != "" ]
          notify-send hyprpicker "copied selected color to the clipboard!"
      end
    '';
    suspend.body = ''
      hyprlock & \
      systemctl suspend
    '';
  };
}
