{ ... }:

{
    # GNOME keyring
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.hyprland.enableGnomeKeyring = true;
    services.xserver.updateDbusEnvironment = true;


    # polkit
    security.polkit.enable = true;

    # rtkit
    security.rtkit.enable = true;
}