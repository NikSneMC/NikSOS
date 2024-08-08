{
  imports = [
    ./backlight.nix
    ./gnome-services.nix
    ./location.nix
    ./pipewire.nix
    ./sddm.nix
  ];

  services = {
    dbus.implementation = "broker";

    printing.enable = true;

    psd = {
      enable = true;
      resyncTimer = "10m";
    };
  };
}
