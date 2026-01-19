{ kestrel, pkgs, ... }:
{
    imports = [
        # Import Calculator
        ./calculator.apps.gnome.nix

        # Import System Monitor
        ./system-monitor.apps.gnome.nix

        # Import Nautilus
        ./nautilus.apps.gnome.nix
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
// kestrel.mkHome {
    dconf.settings = {
        "org/gnome/shell" = {

            favorite-apps = [
                "google-chrome.desktop"
                "org.keepassxc.KeePassXC.desktop"
                "tidal-hifi.desktop"
                "org.gnome.Console.desktop"
                "termius-app.desktop"
                "org.gnome.Nautilus.desktop"
                "steam.desktop"
                "chrome-bancgfmehdjbgbdegmkbpkedapiclkma-Default.desktop"
                "discord.desktop"
                "signal.desktop"
            ];

        };
    };
}
