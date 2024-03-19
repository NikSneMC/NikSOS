function reload_wallpapers
  swww kill
  timeout 0.5
  swww init
  swww img ~/.config/background
  notify-send swww "Configuration reloaded!"
end
