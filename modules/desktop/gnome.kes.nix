{ kestrel, ... }:
{
    imports = [
        # import Gnome extensions
        ./kes/gnome/extensions.nix

        # import Gnome Themes
        ./kes/gnome/theme.nix

        # Import Apps
        ./kes/gnome/apps.nix
    ];

    programs.dconf.enable = true;

    services.displayManager.defaultSession = "gnome";
}
// kestrel.mkHome {
    dconf.settings = {
        "org/gnome/shell" = {
            last-selected-power-profile = "performance";
        };
    };
}
