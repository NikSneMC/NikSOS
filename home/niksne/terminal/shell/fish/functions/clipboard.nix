{
  programs.fish.functions = {
    clipboard_clear.body = ''
      rm "$HOME/.local/cache/cliphist/db"
      cb clr -a
      notify-send "Clipboard" "Cleared" -t 2000
    '';
    clipboard_delete_item.body = ''
      set clip $(cliphist list | rofi -dmenu -p 'clipboard delete item')
      if not [ -z $clip ]
          echo $clip | cliphist delete
          notify-send "Clipboard" "Clip '$clip' was deleted" -t 2000
      end
    '';
    clipboard_emoji.body = "rofi -show emoji -config ~/.config/rofi/clipboard.rasi";
    clipboard_log.body = "rofi -show log -config ~/.config/rofi/clipboard.rasi";
  };
}