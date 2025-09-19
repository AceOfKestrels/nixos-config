{ pkgs, ... }:
{
    home-manager.sharedModules = [
        ./extensions.home.nix
    ];

    # Gnome Extensions
    environment.systemPackages = with pkgs.gnomeExtensions; [
        dash-to-dock
        transparent-window-moving
        tray-icons-reloaded
        system-monitor
    ];
}
