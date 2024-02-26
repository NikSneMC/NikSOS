{ ... }:

{
    # GNOME keyring
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.gdm.enableGnomeKeyring = true;
    services.xserver.updateDbusEnvironment = true;

    # polkit
    security.polkit.enable = true;

    # rtkit
    security.rtkit.enable = true;
}