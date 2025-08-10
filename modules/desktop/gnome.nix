{ pkgs, ... }:

{
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable GNOME
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
    services.displayManager.defaultSession = "gnome-xorg";

    # Setup Gnome Keyring
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.gdm.enableGnomeKeyring = true;

    environment.systemPackages = with pkgs; [
        # Gnome Packetes
        gnome-keyring
        gnome-tweaks
        # Gnome Dependencys
        ibus
        dbus
    ];
}
