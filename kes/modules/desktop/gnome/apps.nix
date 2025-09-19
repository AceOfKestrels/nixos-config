{ kestrel, pkgs, ... }:
{
    imports = [
        # Import Calculator
        ./apps/calculator.nix

        # Import System Monitor
        ./apps/system-monitor.nix

        # Import Nautilus
        ./apps/nautilus.nix
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
            gnome-chess
            gnome-console
        ]
    );

    environment.systemPackages = with pkgs; [ gnome-terminal ];
}
// kestrel.mkHome {
    dconf.settings."org/gnome/shell".favorite-apps = [ ];
}
