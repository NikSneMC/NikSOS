function notifications_pause
    set COUNT (swaync-client -c)
    set ENABLED "{ \"text\": \"󰂜\", \"tooltip\": \"notifications <span color='#a6da95'>on</span>\", \"class\": \"on\" }"
    set DISABLED "{ \"text\": \"󰪑\", \"tooltip\": \"notifications <span color='#ee99a0'>off</span>\", \"class\": \"off\" }"
    
    if [ $COUNT != 0 ]
        set ENABLED "{ \"text\": \"󰂚 $COUNT\", \"tooltip\": \"$COUNT notifications\", \"class\": \"on\" }"
        set DISABLED "{ \"text\": \"󰂛 $COUNT\", \"tooltip\": \"(silent) $COUNT notifications\", \"class\": \"off\" }"
    end

    if swaync-client -D | rg -q "false"
        echo $ENABLED
    else
        echo $DISABLED
    end
end