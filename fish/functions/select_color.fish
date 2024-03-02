function select_color
    set COLOR (hyprpicker -a -r)
    if [ $COLOR != "" ]
        notify-send hyprpicker "copied selected color to the clipboard!"
    end
end