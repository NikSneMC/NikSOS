{
  programs.fish.functions = let
    niri = action:
    # fish
    ''
      set screenshot_filename (echo "$HOME/Pictures/Screenshots/screenshot-$(date +"%d-%m-%Y_%H:%M:%S").png")
      niri msg action ${action}

      if [ -e $screenshot_filename ]
          cat $screenshot_filename | wl-copy --type image/png
          notify-send -i $screenshot_filename -r (cd ~/Pictures/Screenshots/ && ls -1 | wc -l) "Screenshots" "Screenshot was taken" -t 2000
      end
    '';
  in {
    take_screenshot.body = niri "screenshot";
    take_screenshot_window.body = niri "screenshot-window";
    take_screenshot_screen.body = niri "screenshot-screen";
  };
}
