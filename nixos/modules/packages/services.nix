{ pkgs, ... }:

{
  # Systemd services setup
  systemd.packages = with pkgs; [
    auto-cpufreq
  ];
  
  # Enable Services
  services.geoclue2.enable = true;
  programs.direnv.enable = true;
  services.upower.enable = true;
  programs.fish.enable = true;
  programs.dconf.enable = true;
  services.dbus.enable = true;
  services.mpd.enable = true;
  services.ivpn.enable = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  programs.xfconf.enable = true;
  services.tumbler.enable = true; 
  services.fwupd.enable = true;
  services.auto-cpufreq.enable = true;
  services.printing.enable = true;
  environment.pathsToLink = [
    "/libexec"
  ];

  environment.systemPackages = with pkgs; [
    ffmpeg_5-full
    xfce.exo
    libsForQt5.qtstyleplugin-kvantum
    gnome.nautilus
    grim
    grimblast
    slurp
    wl-clipboard
    wl-clip-persist
    wf-recorder
    swaynotificationcenter
    libnotify
    xdg-utils
    cliphist
    wtype
    openssl
  ];
}
