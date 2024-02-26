pkill -9 swaync
pkill -9 swaync-client
timeout 0.5
swaync -c ~/.config/swaync/config.json
notify-send swaync "Configuration reloaded!"