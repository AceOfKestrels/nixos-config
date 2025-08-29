{ pkgs, ... }:

{

    programs.plasma = {
        enable = true;

        workspace = {
            colorScheme = "Catppuccin.Mocha";
            lookAndFeel = null;
            wallpaper = ./assets/wallpaper.avif;
        };

        configFile = {
            kdeglobals.General = {
                AccentColorFromWallpaper = false;
                AccentColor = "#8caaee";
            };
        };

        kscreenlocker.appearance = {
            alwaysShowClock = true;
            showMediaControls = false;
            wallpaper = ./assets/wallpaper.avif;
        };
    };

    home.packages = with pkgs; [
        catppuccin-kde
    ];
}
