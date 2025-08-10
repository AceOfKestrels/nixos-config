{ pkgs, ... }:
{
    home-manager.sharedModules = [
        ./extensions.gnome.home.nix
    ];

    # Gnome Extensions
    environment.systemPackages = with pkgs; [
        gnomeExtensions.dash-to-dock
        gnomeExtensions.transparent-window-moving
        gnomeExtensions.tray-icons-reloaded
        gnomeExtensions.system-monitor
    ];
}
