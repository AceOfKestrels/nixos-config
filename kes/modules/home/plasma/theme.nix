{ pkgs, ... }:

let
    konsoleProfile = "kes-term";
in
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

    programs.konsole = {
        enable = true;
        defaultProfile = "${konsoleProfile}.profile";

        customColorSchemes = {
            "Catpuccin Frappe" = ./assets/catppuccin-frappe.colorscheme;
            "Catpuccin Latte" = ./assets/catppuccin-latte.colorscheme;
            "Catpuccin Macciato" = ./assets/catppuccin-macchiato.colorscheme;
            "Catpuccin Mocha" = ./assets/catppuccin-mocha.colorscheme;
        };

        profiles.${konsoleProfile} = {
            colorScheme = "Catpuccin Mocha";
            font.name = "MesloLGS Nerd Font";
        };
    };

    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
        nerd-fonts.meslo-lg
        catppuccin-kde
    ];
}
