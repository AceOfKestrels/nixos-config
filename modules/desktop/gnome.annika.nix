{ kestrel, pkgs, ... }:
{
    imports = [

        # import Gnome extensions
        ./annika/gnome/extensions.gnome.nix

        # import Gnome Themes
        ./annika/gnome/theme.gnome.nix

        # Import Apps
        ./annika/gnome/apps.gnome.nix
    ];

    programs.dconf.enable = true;

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
            last-selected-power-profile = "performance";
        };
    };
}
