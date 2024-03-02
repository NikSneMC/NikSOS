function fetch_music_player_data
    playerctl -a metadata --format "Now playing: {{artist}} - {{markup_escape(title)}}"
end