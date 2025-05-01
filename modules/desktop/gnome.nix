{ config, pkgs, ... }:

{
    # Enable the X11 windowing system.
    services.xserver.enable = true;


    # Enable GNOME
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Setup Gnome Keyring
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.gdm.enableGnomeKeyring = true;

    environment.systemPackages = with pkgs; [
        # Gnome Extensions
        gnomeExtensions.dash-to-dock
        gnomeExtensions.transparent-window-moving
        gnome-keyring
    ];

    # set env to allo git to store credentials
    environment.variables = {
        GCM_CREDENTIAL_STORE = "secretservice";
    };
}