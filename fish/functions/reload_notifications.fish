function reload_notifications
  pkill -9 swaync
  pkill -9 swaync-client
  swaync -c ~/.config/swaync/config.json
  timeout 0.5
  notify-send swaync "Configuration reloaded!"
end
