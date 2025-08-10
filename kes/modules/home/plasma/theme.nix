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
        defaultProfile = "${konsoleProfile}";

        customColorSchemes = {
            "Catppuccin Frappe" = ./assets/catppuccin-frappe.colorscheme;
            "Catppuccin Latte" = ./assets/catppuccin-latte.colorscheme;
            "Catppuccin Macciato" = ./assets/catppuccin-macchiato.colorscheme;
            "Catppuccin Mocha" = ./assets/catppuccin-mocha.colorscheme;
        };

        profiles.${konsoleProfile}.extraConfig = {
            Appearance = {
                ColorScheme = "Catppuccin Mocha";
                Font = "MesloLGS Nerd Font,10";
                BoldIntense = false;
                UseFontLineCharacters = true;
            };
            "Cursor Options" = {
                CursorShape = 1;
            };
            General = {
                SemanticInputClick = true;
            };
            "Interaction Options" = {
                MiddleClickPasteMode = 1;
                OpenLinksByDirectClickEnabled = true;
                UnderlineFilesEnabled = true;
            };
            Scrolling = {
                HistoryMode = 1;
                HistorySize = 10000;
            };
        };
    };

    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
        nerd-fonts.meslo-lg
        catppuccin-kde
    ];
}
