{ config, pkgs, ... }:

{
    # Enable GNOME
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    environment.systemPackages = with pkgs; [
        gnome-terminal

        # Gnome Extensions
        gnomeExtensions.dash-to-dock
        gnomeExtensions.transparent-window-moving
    ];
}