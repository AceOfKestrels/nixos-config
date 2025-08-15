{ pkgs, ... }:
{
    environment.gnome.excludePackages = with pkgs; [
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
    ];
}
