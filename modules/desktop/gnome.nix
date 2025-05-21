{ config, pkgs, ... }:

{
    # Enable the X11 windowing system.
    services.xserver.enable = true;


    # Enable GNOME
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.displayManager.defaultSession = "gnome-xorg";


    # Setup Gnome Keyring
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.gdm.enableGnomeKeyring = true;

    environment.gnome.excludePackages = (with pkgs; [
        atomix # puzzle game
        cheese # webcam tool
        epiphany # web browser
        geary # email reader
        gnome-tour
        hitori # sudoku game
        iagno # go game
        tali # poker game
    ]);

    environment.systemPackages = with pkgs; [
        # Gnome Extensions
        gnomeExtensions.dash-to-dock
        gnomeExtensions.transparent-window-moving
        gnomeExtensions.tray-icons-reloaded
        gnomeExtensions.system-monitor
        # Gnome Packetes
        gnome-keyring
        gnome-tweaks
        # Gnome Dependencys
        ibus
        dbus
    ];
}