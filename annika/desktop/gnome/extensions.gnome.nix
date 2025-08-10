{ pkgs, ... }:
{
    home-manager.sharedModules = [
        ./extensions.gnome.home.nix
    ];

    # Gnome Extensions
    environment.systemPackages = with pkgs.gnomeExtensions; [
        dash-to-dock
        transparent-window-moving
        tray-icons-reloaded
        system-monitor
    ];
}
