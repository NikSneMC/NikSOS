function record_screen_mp4
    set target_process "wf-recorder"

    if pgrep $target_process > /dev/null
        pkill -9 $target_process
        cb cp ~/Videos/Records/(cd ~/Videos/Records && ls -tA | head -n1 | awk '{print $NF}')
        notify-send -i ~/.config/swaync/icons/camera_mp4_icon.png -r $(cd ~/Videos/Records/ && ls -1 | wc -l) "Recording Stopped 󰙧 (MP4)" -t 2000
    else
        set geometry (slurp)
        if not [ -z $geometry ]
            set record_name $(echo "record-$(date +"%d-%m-%Y---%H:%M:%S").mp4")
            notify-send -i ~/.config/swaync/icons/camera_mp4_icon.png -r $(cd ~/Videos/Records/ && ls -1 | wc -l) "Recording Started  (MP4)" -t 2000
            wf-recorder -g "$geometry" -f "$HOME/Videos/Records/$record_name" -c h264_vaapi -d /dev/dri/renderD128
        end
    end
end