{
  programs.fish.functions = {
    record_screen_png.body = ''
      set screenshot_filename (echo "$HOME/Pictures/Screenshots/screenshot-$(date +"%d-%m-%Y_%H:%M:%S").png")
      grimblast --cursor --freeze save area $screenshot_filename

      if [ -e $screenshot_filename ]
          cat $screenshot_filename | wl-copy --type image/png
          notify-send -i $screenshot_filename -r (cd ~/Pictures/Screenshots/ && ls -1 | wc -l) "Screenshots" "Screenshot was taken" -t 2000
      end
    '';
    record_screen_gif.body = ''
      set target_process "wf-recorder"

      if pgrep $target_process > /dev/null
          pkill -9 $target_process
          wl-copy < ~/Pictures/Records/(cd ~/Pictures/Records && ls -tA | head -n1 | awk '{print $NF}')

          notify-send -i ~/.config/swaync/icons/camera_gif_icon.png -r $(cd ~/Pictures/Records/ && ls -1 | wc -l) "Recording Stopped 󰙧 (GIF)" -t 2000
      else
          set geometry (slurp)
          if not [ -z $geometry ]
              set record_name $(echo "record-$(date +"%d-%m-%Y_%H:%M:%S").gif")
              notify-send -i ~/.config/swaync/icons/camera_gif_icon.png -r $(cd ~/Pictures/Records/ && ls -1 | wc -l) "Recording Started  (GIF)" -t 2000
              wf-recorder -g "$geometry" -f "$HOME/Pictures/Records/$record_name" -c gif -F fps=30
          end
      end
    '';
    record_screen_mp4.body = ''
      set target_process "wf-recorder"

      if pgrep $target_process > /dev/null
          pkill -9 $target_process
          wl-copy < ~/Videos/Records/(cd ~/Videos/Records && ls -tA | head -n1 | awk '{print $NF}')
          notify-send -i ~/.config/swaync/icons/camera_mp4_icon.png -r $(cd ~/Videos/Records/ && ls -1 | wc -l) "Recording Stopped 󰙧 (MP4)" -t 2000
      else
          set geometry (slurp)
          if not [ -z $geometry ]
              set record_name $(echo "record-$(date +"%d-%m-%Y_%H:%M:%S").mp4")
              notify-send -i ~/.config/swaync/icons/camera_mp4_icon.png -r $(cd ~/Videos/Records/ && ls -1 | wc -l) "Recording Started  (MP4)" -t 2000
              wf-recorder -g "$geometry" -f "$HOME/Videos/Records/$record_name" -c h264_vaapi -d /dev/dri/renderD128
          end
      end
    '';
  };
}
