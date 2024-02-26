function record_screen_png
    set screenshot_filename (echo "$HOME/Pictures/Screenshots/screenshot-$(date +"%d-%m-%Y---%H:%M:%S").png")
    grimblast --cursor --freeze save area $screenshot_filename

    if [ -e $screenshot_filename ]
        cat $screenshot_filename | wl-copy --type image/png
        notify-send -i $screenshot_filename -r (cd ~/Pictures/Screenshots/ && ls -1 | wc -l) "Screenshots" "Screenshot was taken" -t 2000
    end
end