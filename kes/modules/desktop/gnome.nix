{ ... }:
{
    imports = [
        # import Default Gnome Config
        ../../../modules/desktop/gnome.nix

        # import Gnome extensions
        ./gnome/extensions.nix

        # import Gnome Themes
        ./gnome/theme.nix

        # Import Apps
        ./gnome/apps.nix
    ];

    home-manager.sharedModules = [
        ./gnome.home.nix
    ];

    programs.dconf.enable = true;
}
