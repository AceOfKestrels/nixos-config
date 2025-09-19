{ pkgs, ... }:
{
    imports = [
        # import Default Gnome Config
        ../../gnome.nix

        # import Gnome extensions
        ./extensions.gnome.nix

        # import Gnome Themes
        ./theme.gnome.nix

        # Import Apps
        ./apps.gnome.nix
    ];

    home-manager.sharedModules = [
        ./gnome.home.nix
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
