{ config, pkgs, ... }:

{
    # Enable the X11 windowing system.
    services.xserver.enable = true;


    # Enable GNOME
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    environment.systemPackages = with pkgs; [
        # Gnome Extensions
        gnomeExtensions.dash-to-dock
        gnomeExtensions.transparent-window-moving
    ];
}