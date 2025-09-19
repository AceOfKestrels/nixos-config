{ pkgs, ... }:
{
    imports = [
        # Import Calculator
        ./apps/calculator.nix

        # Import System Monitor
        ./apps/system-monitor.nix

        # Import Nautilus
        ./apps/nautilus.nix
    ];

    home-manager.sharedModules = [
        ./apps.home.nix
    ];

    environment.gnome.excludePackages = (
        with pkgs;
        [
            atomix
            cheese
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
