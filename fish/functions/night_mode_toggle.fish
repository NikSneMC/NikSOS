function night_mode_toggle
    set target_process "gammastep"
    
    if pgrep $target_process > /dev/null
        pkill -9 .gammastep-wrap
    else
        gammastep
    end
end