## Table of Contents
- [About](#-about)
- [Showcase](#-showcase)
- [Components](#-components)
- [Roadmap](#-roadmap)
- [Installation](#-installation)
- [Keybindings](#️-keybindings)
- [License](#-license)


## 🔧 Components

| Component        | Version/Name                         |
|------------------|--------------------------------------|
| Distro           | NixOS                                |
| Shell            | Fish                                 |
| Display Server   | Wayland                              |
| WM (Compositor)  | Hyprland                             |
| Theme            | Catppuccin Mocha                 |
| Boot Loader      | Grub (themed)                        |
| Graphical Boot   | Plymouth (themed)                    |
| Font             | JetBrains Mono + Nerd Font Patch     |
| Terminal         | WezTerm + Starship (themed)          |
| Bar              | Waybar (themed)                      |
| Notification     | SwayNotificationCenter (themed)      |
| Launcher         | Rofi-Wayland (themed)                |
| Editor           | NVChad, VSCodium (themed)            |
| Night Gamma      | Gammastep                            |
| Fetch Utility    | Neofetch, Cpufetch                   |
| File Browser     | Thunar, Nautilus (themed)            |
| Internet Browser | Vivaldi, Firefox (themed)            |
| Screenshot       | GrimBlast + Slurp                    |
| Recorder         | Wf-recorder                          |
| Color Picker     | Hyprpicker                           |
| Clipboard        | Wl-clipboard + Cliphist              |
| Idle             | Hypridle                             |
| Lock             | Hyprlock (themed)                    |
| Logout menu      | Wlogout (themed)                     |
| Wallpaper        | swww                                 |
| Player           | Spotify (themed)                     |
| Messengers       | Vesktop, Telegram, Whatsapp (themed) |

## 📈 Roadmap

1. Switch to Home Manager
2. More configurable installation
3. Finally fix Scylladb

## 🚀 Installation

1. Download and Install NixOS from the [official site](https://nixos.org/download) (I reccomend installation without graphics).
2. Temporarily enable flakes and install git and curl using the command: `nix-shell --experimental-features 'nix-command flakes' -p git curl`.
3. Run installation script: `curl -fsSL <https://github.com/NikSneMC/NikSOS/raw/main/install.sh> | sh`.
4. For an even more consistent experience across your apps, you can import Catppuccin theme config files into certain programs through their graphical user interfaces. This includes:

 - Websites in your browser (Vivaldi, Firefox):
   - Install the Stylus Extension from its [official website](https://add0n.com/stylus.html).
   - Open the extension's settings page and navigate to the Backup section.
   - Click "Import" and select the file `stylus-catppuccin.json`.
 - DuckDuckGo in any browser:
   - Follow the [official guide](https://github.com/catppuccin/duckduckgo) provided by Catppuccin.
  
## ⌨️ Keybindings

> [!TIP] 
> SUPER is key with Windows logo (Windows keyboards) or OPTION key (Apple keyboards)

### Windows

| Key Combination            | Action                                                     |
|----------------------------|------------------------------------------------------------|
| SUPER + SHIFT + Q          | Kill active window                                         |
| SUPER + F                  | Toggle floating window                                     |
| F11                        | Toggle full-screen                                         |
| SUPER + P                  | Toggle pseudo                                              |
| SUPER + J                  | Toggle split                                               |
| SUPER + H, J, K, L         | Change window focus                                        |
| SUPER + SHIFT + H, J, K, L | Move window                                                |
| SUPER + LMB                | Drag window                                                |
| SUPER + RMB                | Resize window                                              |

### Workspaces
| Key Combination            | Action                                        |
|----------------------------|-----------------------------------------------|
| SUPER + 1..0               | Change workspace (numbered)                   |
| SUPER + F1..F12            | Change workspace (iconed)                     |
| SUPER + SHIFT + 1..0       | Move window to workspace and change workspace |
| SUPER + SHIFT + ALT + 1..0 | Move window to workspace                      |
| SUPER + MOUSE_DOWN         | Go to the next workspace                      |
| SUPER + MOUSE_UP           | Go to the previous workspace                  |

### Utils

| Key Combination | Action                                            |
|-----------------|---------------------------------------------------|
| SUPER + R       | Run command (`rofi -run`)                         |
| SUPER + A       | Open application (`rofi -drun`)                   |
| SUPER + V       | Open clipboard (`rofi -dmenu`)                    |
| SUPER + ;       | Open emoji picker (`rofi -dmenu`)                 |
| SUPER + X       | Open clipboard deletion item menu (`rofi -dmenu`) |
| SUPER + N       | Open notification list (`swaync-client -t`)       |
| SUPER + L       | Launch `hyprlock`                                 |
| SUPER + ESCAPE  | Launch `wlogout`                                  |
| SUPER + T       | Launch `wezterm`                                  |
| SUPER + E       | Launch `nautilus`                                 |
| SUPER + D       | Launch `vesktop`                                  |
| SUPER + B       | Launch `vivaldi`                                  |
| SUPER + G       | Launch `github-desktop`                           |

### Utils with SHIFT modifier

| Key Combination   | Action                                      |
|-------------------|---------------------------------------------|
| SUPER + SHIFT + E | Exit from `hyprland`                        |
| SUPER + SHIFT + A | Open 2fa code menu (`rofi -dmenu`)          |
| SUPER + SHIFT + F | Open rofi filebrowser (`rofi -filebrowser`) |
| SUPER + SHIFT + C | Launch color picker (using `hyperpicer`)    |
| SUPER + SHIFT + S | Take screenshot                             |
| SUPER + SHIFT + R | Record screen area (MP4)                    |
| SUPER + SHIFT + G | Record screen area (GIF)                    |
| SUPER + SHIFT + X | Clear clipboard                             |
| SUPER + SHIFT + N | Toggle notifications (`swaync-client -d`)   |
| SUPER + SHIFT + E | Launch `thunar`                             |
| SUPER + SHIFT + V | Launch `codium`                             |
| SUPER + SHIFT + E | Launch `telegram-desktop`                   |
| SUPER + SHIFT + E | Launch `whatsapp-for-linux`                 |
| SUPER + SHIFT + E | Launch `firefox`                            |

### Scratchpads

| Key Combination   | Action                                                     |
|-------------------|------------------------------------------------------------|
| SUPER + CTRL + T       | Launch scratchpad with `wezterm` using `pyprland`     |
| SUPER + CTRL + V       | Launch scratchpad with `pavucontrol` using `pyprland` |
| SUPER + CTRL + M       | Launch scratchpad with `spotify` using `pyprland`     |


### Reload scripts

| Key Combination        | Action            |
|------------------------|-------------------|
| SUPER + CTRL + ALT + B | Reload `waybar`   |
| SUPER + CTRL + ALT + W | Reload `swww`     |
| SUPER + CTRL + ALT + N | Reload `swaync`   |
| SUPER + CTRL + ALT + P | Reload `pyprland` |

You can find all other keybindings in `/home/.config/hypr/hyprland.conf` in the bind section. All system fish scripts are located at `/home/.config/fish/functions` directory.

## 📜 License

This project is licensed under the GNU AGPL License - see the [LICENSE](LICENSE) file for details.
