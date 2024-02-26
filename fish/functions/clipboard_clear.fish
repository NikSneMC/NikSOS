function clipboard_clear
    rm "$HOME/.cache/cliphist/db"
    cb clr -a
    notify-send "Clipboard" "Cleared" -t 2000
end