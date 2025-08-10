{ pkgs, ... }:
{
    imports = [
        # Import Calculator
        ./calculator.apps.gnome.nix

        # Import System Monitor
        ./system-monitor.apps.gnome.nix

        # Import Nautilus
        ./nautilus.apps.gnome.nix
    ];

    home-manager.sharedModules = [
        ./apps.gnome.home.nix
    ];

    environment.gnome.excludePackages = (
        with pkgs;
        [
            atomix
            cheese
            epiphany
            geary
            gnome-tour
            hitori
            iagno
            tali
            gnome-calendar
            gnome-maps
            gnome-weather
            gnome-contacts
        ]
    );
}
