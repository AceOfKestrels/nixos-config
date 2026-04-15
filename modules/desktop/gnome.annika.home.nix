{ ... }:

{
    imports = [
        ./annika/gnome/apps.home.nix
        ./annika/gnome/calculator.apps.home.nix
        ./annika/gnome/extensions.home.nix
        ./annika/gnome/nautilus.apps.home.nix
        ./annika/gnome/system-monitor.apps.home.nix
        ./annika/gnome/theme.home.nix
    ];

    dconf.settings = {
        "org/gnome/shell" = {
            last-selected-power-profile = "performance";
        };
    };
}
