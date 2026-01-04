{pkgs, ...}: {
  imports = [
    ./danksearch.nix
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    # utils
    cliphist
    wl-clipboard
    wl-clip-persist
    wtype
    wl-screenrec
    wlr-randr
    wl-mirror
  ];

  # make stuff work on wayland
  home.sessionVariables = {
    GDK_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "kvantum";
  };
}
