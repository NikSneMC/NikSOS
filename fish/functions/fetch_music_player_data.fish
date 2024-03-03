function fetch_music_player_data
    set STATUS (playerctl status)
    if [ $STATUS != "Paused" -a $STATUS != "Stopped" -a $STATUS != "No players found" ]
        playerctl -a metadata --format "Now playing: {{artist}} - {{markup_escape(title)}}"
    end
end