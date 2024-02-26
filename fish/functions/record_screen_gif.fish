function record_screen_gif
    set target_process "wf-recorder"

    if pgrep $target_process > /dev/null
        pkill -9 $target_process
        cb cp ~/Pictures/Records/(cd ~/Pictures/Records && ls -tA | head -n1 | awk '{print $NF}')

        notify-send -i ~/.config/swaync/icons/camera_gif_icon.png -r $(cd ~/Pictures/Records/ && ls -1 | wc -l) "Recording Stopped 󰙧 (GIF)" -t 2000
    else
        set geometry (slurp)
        if not [ -z $geometry ]
            set record_name $(echo "record-$(date +"%d-%m-%Y---%H:%M:%S").gif")
            notify-send -i ~/.config/swaync/icons/camera_gif_icon.png -r $(cd ~/Pictures/Records/ && ls -1 | wc -l) "Recording Started  (GIF)" -t 2000
            wf-recorder -g "$geometry" -f "$HOME/Pictures/Records/$record_name" -c gif -F fps=30
        end
    end
end