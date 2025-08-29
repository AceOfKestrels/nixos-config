{ pkgs, ... }:

{
    imports = [
        ../../../../modules/desktop/gnome.nix
        ../../../../annika/desktop/gnome/extensions.gnome.nix # create own config!
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
