{ pkgs, ... }:
{
    imports = [
        # import Default Gnome Config
        ../../../modules/desktop/gnome.nix

        # import Gnome extensions
        ./extensions/extensions.gnome.nix

        # import Gnome Themes
        ./theme/theme.gnome.nix
    ];

    home-manager.sharedModules = [
        ./gnome.home.nix
    ];

    programs.dconf.enable = true;

    environment.gnome.excludePackages = (
        with pkgs;
        [
            atomix # puzzle game
            cheese # webcam tool
            epiphany # web browser
            geary # email reader
            gnome-tour
            hitori # sudoku game
            iagno # go game
            tali # poker game
        ]
    );
}
